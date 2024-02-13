#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYz�U   �_�Dp}���?nߞ����       @[�
C$�MMSG����A�!� �F�@�6����&��4       T�&�#� i��  hh =&� HMdd��zmS�4����Q�Q��Q��  �؇-E;n�"D��Rf1��P@ʹ)�DU��Lѫq �$����,����]5>�G�����Q�Q��i4��n�d�:�Xf~o��G���6#��q�O�D�L6O�m�jz�b�D�ϳ��rt%b���I���/W���4'���GDR�`�\h�I�j��|�^���ދP����9$�D3�Bf^�R)&HrEO(��.|�&J���N]=:�š�_T��dk����!�� ���C���z%�\�����SOS�3��K�dq�^Qף,�"@u��
��w�q�r�H��hp$��/K�!u�QNW܏Х8����2d�,u~�7��E�#�����9XXG��ݺ��p'�p���O����K���~u
�fвZd0R��N�"�C�LZ��QT��wC�C��ػ�%`�~�a�f���qx�AO�Ě\��t����o��\��;�o*��T$�
�����̻]l�:l�H��
4�B��!:M*3�DBe �(t�e'T��SH��Dd�%�G"g]1���Pd�D�]�I.�L{^��rE8P�z�U 