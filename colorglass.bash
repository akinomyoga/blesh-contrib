# bash

bleopt/declare -v colorglass_gamma 0
bleopt/declare -v colorglass_contrast 0
bleopt/declare -v colorglass_rotate 0
bleopt/declare -v colorglass_saturation 0
bleopt/declare -v colorglass_brightness 0
bleopt/declare -v colorglass_alpha 255
bleopt/declare -v colorglass_color 0x8888FF
#bleopt/declare -v colorglass_color   0xFF8888

function bleopt/check:colorglass_gamma {
  if ! ((value=value,value>-100)); then
    ble/util/print "bleopt colorglass_gamma: invalid value '$value'" >&2
    return 1
  fi
  ble/color/g2sgr/.clear-cache
  _ble_contrib_colorglass_gamma=()
  return 0
}
function bleopt/check:colorglass_contrast {
  if ! ((value=value,-100<=value&&value<=100)); then
    ble/util/print "bleopt colorglass_contrast: invalid value '$value'" >&2
    return 1
  fi
  ble/color/g2sgr/.clear-cache
  _ble_contrib_colorglass_contrast=()
  return 0
}
function bleopt/check:colorglass_rotate {
  ((value=value%360,value<0&&(value+=360)))
  ble/color/g2sgr/.clear-cache
  return 0
}
function bleopt/check:colorglass_saturation {
  if ! ((value=value,-100<=value&&value<=100)); then
    ble/util/print "bleopt colorglass_saturation: invalid value '$value'" >&2
    return 1
  fi
  ble/color/g2sgr/.clear-cache
  return 0
}
function bleopt/check:colorglass_brightness {
  if ! ((value=value,-100<=value&&value<=100)); then
    ble/util/print "bleopt colorglass_brightness: invalid value '$value'" >&2
    return 1
  fi
  ble/color/g2sgr/.clear-cache
  return 0
}
function bleopt/check:colorglass_color {
  ble/color/g2sgr/.clear-cache
  return 0
}
function bleopt/check:colorglass_alpha { ble/color/g2sgr/.clear-cache; return 0; }

bleopt -I colorglass_@

_ble_contrib_colorglass_gamma=()
function ble/contrib/colorglass/.gamma {
  local x=$1
  ret=${_ble_contrib_colorglass_gamma[x]-}
  [[ $ret ]] && return 0
  local g=$(((100+bleopt_colorglass_gamma)*_ble_fixed_unit/100))
  ble/fixed-point#pow "$((x*_ble_fixed_unit/255))" "$g"
  ble/fixed-point#round "$((ret*255))"
  ((ret=ret/_ble_fixed_unit,ret<0?(ret=0):(ret>255&&(ret=255))))
  _ble_contrib_colorglass_gamma[x]=$ret
}

_ble_contrib_colorglass_contrast=()
function ble/contrib/colorglass/.contrast {
  local x=$1
  ret=${_ble_contrib_colorglass_contrast[x]-}
  [[ $ret ]] && return 0

  local c=$bleopt_colorglass_contrast
  if ((c==-100)); then
    ((ret=x==0?-_ble_fixed_unit:(x==255?_ble_fixed_unit:0)))
  else
    if ((c>0)); then
      ((c=_ble_fixed_unit-c*_ble_fixed_unit/100))
    else
      ((c=_ble_fixed_unit*_ble_fixed_unit/(_ble_fixed_unit+c*_ble_fixed_unit/100)))
    fi
    ble/fixed-point#pow "$((2*x*_ble_fixed_unit/255-_ble_fixed_unit))" "$c"
  fi
  ble/fixed-point#round "$(((ret+_ble_fixed_unit)*255/2))"
  ((ret=ret/_ble_fixed_unit,ret<0?(ret=0):(ret>255&&(ret=255))))
  _ble_contrib_colorglass_contrast[x]=$ret
}

#------------------------------------------------------------------------------
# Color blindness simulation
# based on https://mk.bcgsc.ca/colorblind/math.mhtml

bleopt/declare -n colorglass_blindness none
function bleopt/check:colorglass_blindness {
  case $value in
  (protanopia|deuteranopia|tritanopia|achromatopsia|none)
    ble/color/g2sgr/.clear-cache
    return 0 ;;
  (*)
    ble/util/print "bleopt colorglass_blindness: invalid value '$value'" >&2
    return 1 ;;
  esac
}

function ble/contrib/colorglass/blindness/.sRGB-to-lRGB/.2 {
  ret=$1
  ((ret=ret*_ble_fixed_unit/255))
  if ((ret<=2651)); then
    # if (value <= 0.04045) return value / 12.92;
    ble/fixed-point#mul "$ret" 5072
  else
    # return pow((value + 0.055) / 1.055, 2.4);
    ble/fixed-point#mul "$((ret+3604))" 62119
    ble/fixed-point#pow "$ret" 157286
  fi
}
function ble/contrib/colorglass/blindness/.lRGB-to-sRGB/.2 {
  ret=$1
  if ((ret<=0)); then
    ret=0
  elif ((ret<205)); then
    # if (value <= 0.0031308) value *= 12.92;
    ble/fixed-point#mul "$ret" 846725
  elif ((ret<_ble_fixed_unit)); then
    # if (value < 1.0) value = 1.055 * value ^ (1.0 / 2.4) - 0.055;
    ble/fixed-point#pow "$ret" 27307
    ble/fixed-point#mul "$ret" 69141
    ((ret-=3604))
  else
    ((ret=_ble_fixed_unit))
  fi
  ((ret=(ret*255+_ble_fixed_unit/2)/_ble_fixed_unit))
}

_ble_contrib_colorglass_sRGB_to_lRGB=()
_ble_contrib_colorglass_lRGB_to_sRGB=()
function ble/contrib/colorglass/blindness/.sRGB-to-lRGB/.1 {
  local value=$1
  if ((value<=0)); then
    ret=0
  elif ((value>=255)); then
    ((ret=_ble_fixed_unit))
  else
    ret=${_ble_contrib_colorglass_sRGB_to_lRGB[value]-}
    if [[ ! $ret ]]; then
      ble/contrib/colorglass/blindness/.sRGB-to-lRGB/.2 "$value"
      _ble_contrib_colorglass_sRGB_to_lRGB[value]=$ret
    fi
  fi
}
function ble/contrib/colorglass/blindness/.lRGB-to-sRGB/.1 {
  local value=$1
  if ((value<=0)); then
    ret=0
  elif ((value>=_ble_fixed_unit)); then
    ((ret=255))
  else
    ret=${_ble_contrib_colorglass_lRGB_to_sRGB[value]-}
    if [[ ! $ret ]]; then
      ble/contrib/colorglass/blindness/.lRGB-to-sRGB/.2 "$value"
      _ble_contrib_colorglass_lRGB_to_sRGB[value]=$ret
    fi
  fi
}

## @fn ble/contrib/colorglass/blindness/.sRGB-to-lRGB
##   @var[ref] R G B
function ble/contrib/colorglass/blindness/.sRGB-to-lRGB {
  local ret
  ble/contrib/colorglass/blindness/.sRGB-to-lRGB/.1 "$R"; R=$ret
  ble/contrib/colorglass/blindness/.sRGB-to-lRGB/.1 "$G"; G=$ret
  ble/contrib/colorglass/blindness/.sRGB-to-lRGB/.1 "$B"; B=$ret
}

## @fn ble/contrib/colorglass/blindness/.lRGB-to-sRGB
##   @var[ref] R G B
function ble/contrib/colorglass/blindness/.lRGB-to-sRGB {
  local ret
  ble/contrib/colorglass/blindness/.lRGB-to-sRGB/.1 "$R"; R=$ret
  ble/contrib/colorglass/blindness/.lRGB-to-sRGB/.1 "$G"; G=$ret
  ble/contrib/colorglass/blindness/.lRGB-to-sRGB/.1 "$B"; B=$ret
}

## @fn ble/contrib/colorglass/blindness/simulate type
##   @var[ref] R G B
function ble/contrib/colorglass/blindness/simulate {
  case $1 in
  (protanopia)
    # \begin{matrix}
    #  0.170556992 & 0.829443014 & 0 \\
    #  0.170556991 & 0.829443008 & 0 \\
    # -0.004517144 & 0.004517144 & 1
    # \end{matrix}
    ble/contrib/colorglass/blindness/.sRGB-to-lRGB
    local v1=$(((R*11178+G*54358)/_ble_fixed_unit))
    local v2=$(((-R*295+G*296)/_ble_fixed_unit+B))
    ((R=v1,G=v1,B=v2))
    ble/contrib/colorglass/blindness/.lRGB-to-sRGB ;;
  (deuteranopia)
    # \begin{matrix}
    #  0.33066007 & 0.66933993 & 0 \\
    #  0.33066007 & 0.66933993 & 0 \\
    # -0.02785538 & 0.02785538 & 1
    # \end{matrix}
    ble/contrib/colorglass/blindness/.sRGB-to-lRGB
    local v1=$(((R*21670+G*43866)/_ble_fixed_unit))
    local v2=$(((-R*1825+G*1826)/_ble_fixed_unit+B))
    ((R=v1,G=v1,B=v2))
    ble/contrib/colorglass/blindness/.lRGB-to-sRGB ;;
  (tritanopia)
    # \begin{matrix}
    #  1 & 0.1273989 & -0.1273989 \\
    #  0 & 0.8739093 &  0.1260907 \\
    #  0 & 0.8739093 &  0.1260907
    # \end{matrix}
    ble/contrib/colorglass/blindness/.sRGB-to-lRGB
    local v1=$(((G*8349-B*8348)/_ble_fixed_unit+R))
    local v2=$(((G*57273+B*8263)/_ble_fixed_unit))
    ((R=v1,G=v2,B=v2))
    ble/contrib/colorglass/blindness/.lRGB-to-sRGB ;;
  (achromatopsia)
    # \begin{matrix}
    #  0.2126 & 0.7152 & 0.0722 \\
    #  0.2126 & 0.7152 & 0.0722 \\
    #  0.2126 & 0.7152 & 0.0722
    # \end{matrix}
    ble/contrib/colorglass/blindness/.sRGB-to-lRGB
    local v1=$(((R*13933+G*46871+B*4732)/_ble_fixed_unit))
    ((R=v1,G=v1,B=v1))
    ble/contrib/colorglass/blindness/.lRGB-to-sRGB ;;
  esac
}

#------------------------------------------------------------------------------

_ble_contrib_colorglass_base16_palette=()

bleopt/declare -v colorglass_base16_palette ''
function bleopt/check:colorglass_base16_palette {
  value=${value//["$_ble_term_IFS"]}
  if [[ ! $value ]]; then
    _ble_contrib_colorglass_base16_palette=()
  else
    local file=${BASH_SOURCE[0]%.*}.base16.dat
    if [[ ! -s $file ]]; then
      ble/util/print "bleopt colorglass_base16_palette: database '$file' not found." >&2
      return 1
    fi

    local -a colors
    local -x key=$value
    ble/util/assign-words colors 'ble/bin/awk '\''BEGIN { key = ENVIRON["key"]; } $0 !~ /^[[:blank:]]*#/ && $1 == key { $1 = ""; print; }'\'' "$file"'
    if ((${#colors[@]}==0)); then
      ble/util/print "bleopt colorglass_base16_palette: invalid palette '$value'." >&2
      return 1
    fi

    _ble_contrib_colorglass_base16_palette=("${colors[@]}")
  fi
  ble/color/g2sgr/.clear-cache
  return 0
}

## @fn ble/contrib/colorglass.filter
##   @var[ref] ccode
function ble/contrib/colorglass.filter {
  # 24bit color
  local R= G= B= dirty=
  if ((ccode<16)); then
    local hex=${_ble_contrib_colorglass_base16_palette[ccode]-}
    if [[ $hex ]]; then
      ((hex=hex,R=0xFF&hex>>16,G=0xFF&hex>>8,B=0xFF&hex,dirty=1))
    elif ((ccode==7)); then
      ((R=G=B=0xAA))
    elif ((ccode==8)); then
      ((R=G=B=0x55))
    else
      local L=$((ccode>=8?0xFF:0x80))
      ((R=(ccode&1)?L:0))
      ((G=(ccode&2)?L:0))
      ((B=(ccode&4)?L:0))
    fi
  elif ((ccode<256)); then
    local index_colors=$_ble_color_index_colors_default
    [[ $bleopt_term_index_colors == auto ]] || ((index_colors=bleopt_term_index_colors))
    if ((index_colors==88)); then
      # xterm-88color (16+4x4x4+8grey)
      if ((ccode>=80)); then
        ((R=G=B=46+25*(ccode-80)))
      else
        local k
        ((k=(ccode-16)/16 ,R=k?81+k*58:0))
        ((k=(ccode-16)/4%4,G=k?81+k*58:0))
        ((k=(ccode-16)%4  ,B=k?81+k*58:0))
      fi
    else
      # xterm-256color (16+6x6x6+24grey)
      if ((ccode>=232)); then
        ((R=G=B=8+10*(ccode-232)))
      else
        local k
        ((k=(ccode-16)/36 ,R=k?55+k*40:0))
        ((k=(ccode-16)/6%6,G=k?55+k*40:0))
        ((k=(ccode-16)%6  ,B=k?55+k*40:0))
      fi
    fi
  elif ((0x1000000<=ccode&&ccode<=0x1FFFFFF)); then
    ((R=0xFF&ccode>>16))
    ((G=0xFF&ccode>>8))
    ((B=0xFF&ccode))
  fi

  local rot=$((bleopt_colorglass_rotate))
  local sat=$((bleopt_colorglass_saturation))
  local bright=$((bleopt_colorglass_brightness))
  if ((rot||sat||bright)); then
    dirty=1
    local Min x y h
    case $((R<=B?(R<=G?0:1):(G<=B?1:2))) in
    (0) Min=$R x=$((G-Min)) y=$((B-Min)) h=1200 ;;
    (1) Min=$G x=$((B-Min)) y=$((R-Min)) h=2400 ;;
    (2) Min=$B x=$((R-Min)) y=$((G-Min)) h=0 ;;
    esac
    local Range=$((x>y?x:y))
    if ((Range)); then
      if ((x>y)); then
        ((h+=y*600/x))
      else
        ((h+=1200-x*600/y))
      fi
    fi
    ((h=(h+rot*10)%3600))

    if ((bright)); then
      ((bright=_ble_fixed_unit*bright/100))
      if ((bright<0)); then
        ((bright=_ble_fixed_unit+bright))
        ((Min=Min*bright/_ble_fixed_unit))
        ((Range=Range*bright/_ble_fixed_unit))
      else
        ((bright=_ble_fixed_unit-bright))
        ((Min=255-(255-Min)*bright/_ble_fixed_unit))
        ((Range=Range*bright/_ble_fixed_unit))
      fi
    fi

    if ((sat)); then
      ((sat=_ble_fixed_unit*sat/100))
      if ((sat<0)); then
        ((sat=-sat))
        ((Min+=Range*sat/(2*_ble_fixed_unit)))
        ((Range=Range*(_ble_fixed_unit-sat)/_ble_fixed_unit))
      else
        local delta=$(((255-Range)*sat/_ble_fixed_unit)) Max
        ((Max=Min+Range+delta/2,Max>255&&(Max=255)))
        ((Min-=delta/2,Min<0&&(Min=0)))
        ((Range=Max-Min))
      fi
    fi

    local h1 h2 x=$Min y=$Min z=$Min
    ((h1=h%1200,h2=1200-h1,
      x+=Range*(h2<600?h2:600)/600,
      y+=Range*(h1<600?h1:600)/600))
    case $((h/1200)) in
    (0) R=$x G=$y B=$z ;;
    (1) R=$z G=$x B=$y ;;
    (2) R=$y G=$z B=$x ;;
    esac
  fi

  local alpha=$((bleopt_colorglass_alpha))
  if ((alpha!=255)); then
    dirty=1
    local min max ofac
    if ((R<G)); then
      ((min=R<B?R:B,max=G>B?G:B))
    else
      ((min=G<B?G:B,max=R>B?R:B))
    fi
    ((ofac=max<255-min?max:255-min))
    ((ofac=ofac*2<255?ofac*2:255))
    ((alpha=alpha*ofac/255))
    if ((alpha)); then
      local c1=$((bleopt_colorglass_color))
      local r1=$((0xFF&c1>>16))
      local g1=$((0xFF&c1>>8))
      local b1=$((0xFF&c1))
      ((R=r1+(R-r1)*alpha/255))
      ((G=g1+(G-g1)*alpha/255))
      ((B=b1+(B-b1)*alpha/255))
    fi
  fi

  if ((bleopt_colorglass_contrast)); then
    dirty=1
    local ret
    ble/contrib/colorglass/.contrast "$R"; R=$ret
    ble/contrib/colorglass/.contrast "$G"; G=$ret
    ble/contrib/colorglass/.contrast "$B"; B=$ret
  fi

  if ((bleopt_colorglass_gamma)); then
    dirty=1
    local ret
    ble/contrib/colorglass/.gamma "$R"; R=$ret
    ble/contrib/colorglass/.gamma "$G"; G=$ret
    ble/contrib/colorglass/.gamma "$B"; B=$ret
  fi

  if [[ $bleopt_colorglass_blindness != none ]]; then
    dirty=1
    ble/contrib/colorglass/blindness/simulate "$bleopt_colorglass_blindness"
  fi

  ((dirty)) && ((ccode=0x1000000|R<<16|G<<8|B))
  return 0
}
_ble_color_color2sgr_filter=ble/contrib/colorglass.filter

#------------------------------------------------------------------------------

_ble_fixed_unit=0x10000
_ble_fixed_e=$((0x2b7e1))
_ble_fixed_ln2=$((0xb172))
_ble_fixed_log2=$((0x4d10))

function ble/fixed-point#tostr {
  ret=$1
  ((ret=(ret*1000000+5)/(_ble_fixed_unit*10)))
  ret=0000$ret
  ret=${ret::${#ret}-5}.${ret:${#ret}-5}
  ble/string#match "$ret" '^0+' &&
    ret=${ret:${#BASH_REMATCH}}
  ret=${ret/#./0.}
}

function ble/fixed-point#round {
  local x=$1
  ((x+=x>=0?_ble_fixed_unit/2:-_ble_fixed_unit/2,
    ret=x/_ble_fixed_unit*_ble_fixed_unit))
}

function ble/fixed-point#mul {
  if (($#)); then
    ret=$1; shift
    local a
    for a; do ((ret=ret*a/_ble_fixed_unit)); done
  else
    ret=$_ble_fixed_unit
  fi
}

function ble/fixed-point#div {
  if (($#)); then
    ret=$1; shift
    local a
    for a; do ((ret=ret*_ble_fixed_unit/a)); done
  else
    ret=$_ble_fixed_unit
  fi
}

_ble_fixed_sqrt=()
function ble/fixed-point#sqrt {
  local x=$1
  if ((x<=0)); then
    ret=0
  elif [[ ${_ble_fixed_sqrt[x]} ]]; then
    ret=${_ble_fixed_sqrt[x]}
  else
    local y=$x c=0 dy
    while ((c++<=16&&(dy=(x*_ble_fixed_unit-y*y)/(2*y)))); do
      ((y+=dy))
    done

    # 微修正
    local res=$((x*_ble_fixed_unit-y*y))
    if ((res<0)); then
      while ((res+y<=0)); do
        ((res+=2*y---1))
      done
    elif ((res>0)); then
      while ((0<res-y)); do
        ((res-=2*y+++1))
      done
    fi

    ret=$y
    _ble_fixed_sqrt[x]=$ret
  fi
}

function ble/fixed-point#pow {
  local x=$1 y=$2 out=$_ble_fixed_unit sgn=1
  if ((x==0)); then
    ret=0
    return 0
  elif ((x<0)); then
    ((x=-x,sgn=-1))
  fi

  if ((x!=_ble_fixed_unit)); then
    local p xx fac
    if ((p=y/_ble_fixed_unit)); then
      xx=$x fac=()
      while ((p&1)) && ble/array#push fac "$xx"; ((p>>=1)); do
        ((xx=xx*xx/_ble_fixed_unit))
      done
      ((x>_ble_fixed_unit)) && ble/array#reverse fac
      ble/fixed-point#mul "${fac[@]}"
      ((out=out*ret/_ble_fixed_unit))
    fi

    if ((p=y&0xFFFF)); then
      xx=$x fac=()
      while
        ble/fixed-point#sqrt "$xx"
        xx=$ret
        (((p<<=1)&_ble_fixed_unit)) && ble/array#push fac "$xx"
        ((p&0xFFFF))
      do ((1)); done
      ((x<_ble_fixed_unit)) && ble/array#reverse fac
      ble/fixed-point#mul "${fac[@]}"
      ((out=out*ret/_ble_fixed_unit))
    fi
  fi
  ((ret=out*sgn))
}
function ble/fixed-point#exp {
  ble/fixed-point#pow "$_ble_fixed_e" "$1"
}

function ble/fixed-point#lb {
  local x=$1
  ((x<0&&(x=-x)))
  if ((x==0)); then
    ((ret=-32*_ble_fixed_unit))
  elif ((x==_ble_fixed_unit)); then
    ret=0
  else
    local p=0
    if ((x>=_ble_fixed_unit)); then
      while ((x>=256*_ble_fixed_unit)); do ((p+=8,x>>=8)); done
      while ((x>=8*_ble_fixed_unit)); do ((p+=3,x>>=3)); done
      while ((x>=2*_ble_fixed_unit)); do ((p+=1,x>>=1)); done
    else
      while ((x<256)); do ((p-=8,x<<=8)); done
      while ((x<_ble_fixed_unit/8)); do ((p-=3,x<<=3)); done
      while ((x<_ble_fixed_unit)); do ((p--,x<<=1)); done
    fi
    local out=$((p*_ble_fixed_unit))

    local bit=$_ble_fixed_unit l
    ((ret=2*_ble_fixed_unit))
    for l in {1..8}; do
      ((bit/=2))
      ble/fixed-point#sqrt "$ret"
      ((x>=ret)) && ((x=x*_ble_fixed_unit/ret,out+=bit))
    done
    ((x-=_ble_fixed_unit))
    ((out+=(_ble_fixed_unit-x/2)*x/_ble_fixed_unit*_ble_fixed_unit/_ble_fixed_ln2))
    ret=$out
  fi
}
function ble/fixed-point#ln {
  ble/fixed-point#lb "$1"
  ((ret=ret*_ble_fixed_ln2/_ble_fixed_unit))
}
function ble/fixed-point#log {
  ble/fixed-point#lb "$1"
  ((ret=ret*_ble_fixed_log2/_ble_fixed_unit))
}

# --- test codes ---

# ble/fixed-point#lb "$((e=2718281828*_ble_fixed_unit/1000000000))"
# printf "lb e = %x\n" "$ret"
# ble/fixed-point#tostr "$((_ble_fixed_unit*_ble_fixed_unit/ret))"
# echo "ln 2 = $ret"
# ble/fixed-point#log "$((2*_ble_fixed_unit))"
# ble/fixed-point#tostr "$ret"
# echo "$ret"

# ble/fixed-point#sqrt $((0x0100))
# time for a in {0..256}; do
#   ble/fixed-point#sqrt "$((a*_ble_fixed_unit/256))"
#   sqrt[a]=$ret
#   # ble/fixed-point#tostr "$((ret*ret*256/_ble_fixed_unit))"
#   # printf "$a -> %x -> $ret\n" "$sqrt"
# done
# ble/fixed-point#pow $((2*_ble_fixed_unit)) $((3*_ble_fixed_unit))
# ble/fixed-point#tostr "$ret"
# echo "$ret"
# ble/fixed-point#pow $((2*_ble_fixed_unit)) $((_ble_fixed_unit/2))
# ble/fixed-point#tostr "$ret"
# echo "$ret"

# for x in {0..256}; do
#   for y in {0..256}; do
#     ble/fixed-point#pow "$((x*256))" "$((y*256))"
#     ble/fixed-point#tostr "$ret"
#     echo "$x $y $ret"
#   done
#   echo
# done | awk 'NF == 3 {print $1,$2,$3,($1/256)^($2/256);next}{print}' > colorglass.pow.txt
