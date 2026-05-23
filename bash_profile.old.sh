# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#set -x
#PS4='+ $(date "+%s.%N")\011 '
# If not running interactively, don't do anything
#case $- in
    #*i*) ;;
      #*) return;;
#esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Compiler version 
export CXX=g++-9
export CC=gcc-9

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# taejinp's custom alias
alias ocid3='ssh draco-oci-dc-03.draco-oci-iad.nvidia.com'
alias ocics='ssh cs-oci-ord'
alias drc='ssh draco-rno-login-0001'
alias drc1='ssh draco-rno-login-0001'
alias drc2='ssh draco-rno-login-0002'
alias ocid3='ssh draco-oci-dc-03'
alias ocid2='ssh draco-oci-dc-02'
alias ocid1='ssh draco-oci-dc-01'
alias ocics='ssh cs-oci-ord'
alias ocics1='ssh cs-oci-ord-01'
alias ocics2='ssh cs-oci-ord-02'
alias ocics3='ssh cs-oci-ord-03'
alias ocicsdc1='ssh  cs-oci-ord-dc-01'
alias ocicsdc2='ssh  cs-oci-ord-dc-02'
alias ocicsdc3='ssh  cs-oci-ord-dc-03'
alias ocicsdc4='ssh  cs-oci-ord-dc-04'

#alias drc='ssh draco-rno-login' 
alias drc='ssh taejinp@draco-rno-login-0001.draco-rno.nvidia.com'
alias bb='source ~/.bash_profile'
alias be='vim ~/.bash_profile'
alias ve='vim ~/.vimrc'
alias gpusee='watch --color -n 0.01 "gpustat --color"'
alias nemo='cd ~/projects/NeMo; conda activate env04;clear'
alias cde='conda deactivate'
alias asr_nemo='cd ~/projects/git_clones/NeMo/examples/asr; conda activate env04;clear'
alias eval_asr='cd ~/projects/NeMo/examples/asr/experimental/sclite'
alias env01='source ~/.bash_profile;conda activate nemo_env_01'
alias env03='source ~/.bash_profile;conda activate env03'
alias env04='source ~/.bash_profile;conda activate env04'
alias t01='source ~/.bash_profile;conda activate t01'
alias nvd='mosh taejinp@10.110.41.21'
alias nvk='ssh lab@10.110.43.27'
alias nvw='ssh lab@10.110.43.39'
alias nvb='mosh taejinp@10.110.40.120'
alias jgd='ssh lab@10.110.41.23'


alias envtf04='source ~/.bash_profile;conda activate envtf04'
alias pytt='cd ~/projects/pytorch-tutorial/tutorials/01-basics/feedforward_neural_network'
alias ndt='cd ~/projects/NeMo/examples/speaker_recognition/'  # NeMo Diar Test
alias nemo_spkutils='cd ~/projects/NeMo/nemo/collections/asr/parts/utils'

alias stfx='python setup.py style --fix --scope=nemo'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias stylefix='python ~/projects/NeMo/setup.py style --fix'
alias run_diar='bash /home/taejinp/projects/NeMo/examples/speaker_recognition/offline_diarize.sh'
alias run_online_diar='bash /home/taejinp/projects/NeMo/examples/speaker_recognition/online_diarize.sh'
alias vim_diar='vim /home/taejinp/projects/NeMo/examples/speaker_recognition/offline_diarize.sh'
#alias nith='ssh lab@10.110.42.148' ### pw:labuser
#alias nith='ssh lab@10.110.42.249' ### pw:labuser
alias nith='ssh lab@10.110.42.251' ### pw:labuser
alias gdata='cd ~/gdrive/audio_data/'
alias nutils='cd nemo/collections/asr/parts/utils/'
alias godiar='cd ~/projects/run_time/;env04'
alias runt='cd ~/projects/run_time/'
alias tvd='cd ~/projects/run_time/; conda activate rnnt01'
alias tsvad='cd ~/projects/ts_vad_diar/NeMo/;conda activate rnnt01'
alias sfs='cd ~/projects/sortformer_script/diar_sortformer/local_machine_scripts'
alias de2e='cd /gpfs/fs1/projects/ent_aiapps/datasets/data/diarization_e2e'
print_script_a="script -q -c 'cat print_script_0.sh'"
print_script_c="script -q -c 'cat print_script_0.sh | tail -7' /dev/null"
print_script_b="script -q -c 'cat print_script_0.sh | tail -12' /dev/null"
print_script_d="script -q -c 'cat print_script_0.sh | tail -24' /dev/null"
print_script_e="script -q -c 'cat print_script_0.sh | tail -50' /dev/null"
#alias print_script="script -q -c 'bash print_script.sh' /dev/null"
alias transa='watch  -t -n 0.1 --color "$print_script_a"'
alias transb='watch  -n 0.1 --color "$print_script_b"'
alias transc='watch  -n 0.1 --color "$print_script_c"'
alias transd='watch  -n 0.1 --color "$print_script_d"'
alias transe='watch  -n 0.1 --color "$print_script_e"'
alias mdsf='cd /disk_a/models/sortformer_diarization/'
alias chs='cd /home/taejinp/projects/chooper_scripts'
alias lms='cd /home/taejinp/projects/diar_sortformer/diar_sortformer/local_machine_scripts'
alias lms0='cd /home/taejinp/projects/do_not_use_script_diar_sortformer/diar_sortformer/local_machine_scripts'
alias dms='cd /home/taejinp/projects/data_scripts'
alias kdm='ssh lab@10.110.43.27'

alias moshkill='kill `pidof mosh-server`'
#alias trans_d='watch  -n 0.1 --color "$print_script_c"'
#alias transv='watch  -n 0.1 --color "print_script"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Anaconda
export LD_LIBRARY_PATH=""
export PATH=~/anaconda3/bin:/bin:/usr/bin:$PATH

#CUDA_VER="cuda-11.8"
CUDA_VER="cuda-12.1"
#CUDA_VER="cuda-12.3"
export PATH=/usr/local/$CUDA_VER/bin${PATH:+:${PATH}}
#export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/$CUDA_VER/lib64:/usr/lib/x86_64-linux-gnu:/usr/local/lib/openmpi:/opt/OpenBLAS/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH="/usr/local/$CUDA_VER/lib64:$LD_LIBRARY_PATH"
#export LD_LIBRARY_PATH="/usr/local/cuda-11.8/lib64:$LD_LIBRARY_PATH"

#export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
#export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/cuda/lib64:/usr/lib/x86_64-linux-gnu:/usr/local/lib/openmpi:/opt/OpenBLAS/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

export PATH="$PATH:/home/taejinp/ngc-cli"
export PATH="$PATH:/home/taejinp/.local/bin"


export KENLM_ROOT="/home/taejinp/projects"
 #export KENLM_ROOT="/home/taejinp/projects/kenlm":$PATH

### This is for sm_86 support for Ampere GPUs (A5000, RTX3090, etc)
TORCH_CUDA_ARCH_LIST="8.6"
#export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python3.6/dist-packages/torchtext_mod"
#export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python3.6/dist-packages/torchtext_mod"
#export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python3.6/dist-packages/torchtext_edit"
#export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python3.6/dist-packages/torchtext_edit/data"
export torchtext_mod="/usr/local/lib/python3.6/dist-packages/torchtext_mod"

### <<< Start of Kaldi
export KALDI_ROOT="/home/taejinp/kaldi":$PATH
# Kaldi export (added by inctrl)
#export PATH=/home/taejinp/kaldi/src/featbin/:$PATH
#export PATH=/home/taejinp/kaldi/src/bin/:$PATH
#export PATH=/home/taejinp/kaldi/src/fstbin:$PATH
#export PATH=/home/taejinp/kaldi/src/ivectorbin:$PATH

#export PATH=/home/taejinp/kaldi/egs/callhome_diarization/xvec/utils:$PATH
#export LD_LIBRARY_PATH=/home/taejinp/kaldi/src/featbin:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/home/taejinp/kaldi/src/bin:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/home/taejinp/kaldi/src/fstbin:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/home/taejinp/kaldi/src/ivectorbin/:$LD_LIBRARY_PATH

#export LD_LIBRARY_PATH=/home/taejinp/kaldi/src/:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/home/taejinp/kaldi/tools/openfst-1.6.2/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/home/taejinp/kaldi/tools/openfst-1.6.2/src/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/home/taejinp/kaldi/src/fstbin/fstaddselfloops:$LD_LIBRARY_PATH


export KALDI_ROOT="/home/taejinp/kaldi":$PATH
#export PATH=/home/taejinp/Downloads/Kaldi-master/tools/sph2pipe_v2.5/:$PATH
#export PATH=/home/taejinp/kaldi/tools/sph2pipe_v2.5/:$PATH
export PATH=/usr/local/$CUDA_VER/bin:$PATH
export PATH=/usr/local/$CUDA_VER/lib64:$PATH
#export CUDA_INC_DIR=/usr/local/$CUDA_VER/lib64:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/local/$CUDA_VER/lib64:$LD_LIBRARY_PATH
export PATH=/usr/local/lib:$PATH
export PATH=.:$PATH
export WITH_METIS=1
export METIS_DLL=/usr/local/lib/libmetis.dylib

### <<< End of Kaldi

# For torchtext_mod

git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
git_id ()       { git config --list | grep remote.origin.url | awk -F "github.com" '{print $2}' | cut -f2 -d'/'; }
git_reponame () { git config --list | grep remote.origin.url | awk -F "github.com" '{print $2}' | cut -f3 -d'/' | cut -f1 -d'.'; }

#HOST='\033[01;34m\]\h\033[22m\]'; HOST=' '$HOST
#TIME='\033[02;96m\]\t \033[01;32m\]'
#LOCATION=' \033[00;39m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`\033[01;39m\]'
#BRANCH=' \033[00;33m\]$(git_branch)\[\033[00m\]\n\$ '
#export TERM="xterm-256color"
export TERM="screen-256color"


#TIME='\033[02;96m\]\t \033[01;32m\]'
TIME='\033[02;96m\]\033[01;32m\]'
#USER=$USER;
#USER='\033[02;32m\]$(USER) \033[01;34m\]'
HOST='\033[01;31m\]\h\033[00;54m\]';
#LOCATION=' \033[01;39m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`\033[01;39m\]'
LOCATION=':\033[00;39m\]\w \033[01;39m\]'
BRANCH='\033[00;33m\]$(git_id) \033[02;36m\]$(git_branch)\[\033[00m\]\n\$ '
#PS1=$TIME$USER$HOST$LOCATION$BRANCH
PS1=$TIME$USER'\033[00;39m\]@\033[00m\]'$HOST$LOCATION$BRANCH
#PS1=$USER'\033[00;39m\]@\033[00m\]'$HOST$LOCATION$BRANCH
PS2='\n\$\[\033[01;36m\]$>'
ls --color=al > /dev/null 2>&1 && alias lsc='ls -F --color=al' || alias lsc='ls -G'

#export PATH="$PATH:/home/taejinp/ngc"
#export PATH="$PATH:/home/taejinp/ngc-cli"
function nvkill() {
nvidia-smi | grep 'python' | awk '{ print $5 }' | xargs -n1 kill -9
}

function wandbkill() {
    pgrep -f wandb | xargs -n1 kill -9
}


function nvkill_args() {
nvidia-smi | grep 'python' | awk '{ print $5 }'
 }

function fn() {
find . -name $1 | xargs readlink -e
}
function jnb() {
jupyter notebook --no-browser --port=$1
}
function tjcp() {
echo rsync -rv taejinp@`myip`:"$PWD"
}
function labcp() {
echo rsync -rv lab@`myip`:"$PWD"
}
function myip() {
hostname -I | awk '{print $1}'
}
function cnv() {
conda activate $1
}
function dspace() {
df -hT | head -1; df -hT | grep -E '/sd'
#df -hT | grep -E '/sd'
}
function dspc() {
df -hT | head -1; df -hT | grep -E '/sd'
#df -hT | grep -E '/sd'
}
function duf() {
du -ha --max-depth=1
}
function wduf() {
    watch -n0.1 "du -ha --max-depth=1"
}
function dufg() {
du -ha --max-depth=1 | egrep -E "G" | sort -n -r
}
function findir() {
find $1 -name $2 -printf $PWD/$1/"%f\n"
}
function ffp() {
find $(pwd /) -name "$1"
}
function conac () {
conda activate $1
}
function myip() {
hostname -I | awk '{print $1}'
}  
function pykill () {
pkill -9 python
}
function ngc_ws_nae() {
mkdir -p /nemo_asr_eval
ngc workspace mount nemo_asr_eval /nemo_asr_eval --mode RW
}
function pie() {
pip install --editable ".[all]"
}
function jnb() {
jupyter notebook --no-browser --port=$1
}

function cnvd() {
conda activate $1
conda deactivate
conda deactivate
conda activate $1
}
function cnde() {
conda deactivate
}
function cnv() {
conda activate $1
}
function cdd() {
cd "$(dirname $1)"
}
function trc() {
SCR="script -q -c 'cat print_script_${1}.sh' /dev/null"; watch  -n 0.1 --color "$SCR"
}
function fpth() {
find $PWD/$1*
}
function rdl() {
readlink -e $1
}
function transn() {
print_script_comm="script -q -c 'cat print_script.sh | tail -$1' /dev/null"
watch  -n 0.1 --color "$print_script_comm"
}

function ezcp() {
echo "rsync -rv lab@10.110.43.14:$PWD"
echo "PW: labuser06052021"
}

function allwav() {
    find . -type f -name "*.wav"
}

function fisher_d() {
cd /disk_a_nvd/datasets/Fisher
}

function s3ls () {
aws s3 ls --endpoint=https://pdx.s8k.io 
}

function s3fr() {
aws s3 --endpoint=https://pdx.s8k.io ls s3://"$1" --recursive
}

function alldiff(){
 git diff --name-only main...
}

function s3fc() {
aws s3 --endpoint=https://pdx.s8k.io ls s3://"$1" 
}

function s3cp() {
aws s3 --endpoint=https://pdx.s8k.io cp "$1" s3://"$2" --recursive
}

function s3mb() {
aws s3 --endpoint=https://pdx.s8k.io mb s3://"$1"
}
function s3mv() {
aws s3 mv s3://"$1" s3://"$2" --recursive --endpoint=https://pdx.s8k.io
}

function s3rm() {
aws s3 --endpoint=https://pdx.s8k.io rm s3://"$1" --recursive
}

function s3rmc() {
aws s3 --endpoint=https://pdx.s8k.io rm s3://"$1" 
}

function killtrans() {
ps aux | grep "print_script" | awk '{print $2}' | xargs kill -9
}


function kvd() {
ssh lab@10.110.43.27
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('~/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "~/anaconda3/etc/profile.d/conda.sh" ]; then
        . "~/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="~/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
source ~/anaconda3/etc/profile.d/conda.sh
 #<<< conda initialize <<<

source ~/.local/share/blesh/ble.sh

export PATH="/usr/local/go/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
