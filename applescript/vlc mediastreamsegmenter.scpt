FasdUAS 1.101.10   ��   ��    k             l     ��  ��    2 ,vlc stream to ipad with mediastreamsegmenter     � 	 	 X v l c   s t r e a m   t o   i p a d   w i t h   m e d i a s t r e a m s e g m e n t e r   
  
 l    v ����  O     v    k    u       l   ��������  ��  ��        l   ��  ��    % open dialog box to select video     �   > o p e n   d i a l o g   b o x   t o   s e l e c t   v i d e o      r        I   ���� 
�� .sysostdfalis    ��� null��    �� ��
�� 
prmp  m       �   0 s e l e c t   a   v i d e o   t o   s t r e a m��    o      ���� 	0 video         l   ��������  ��  ��      ! " ! l   �� # $��   # + %convert to posix path for bash script    $ � % % J c o n v e r t   t o   p o s i x   p a t h   f o r   b a s h   s c r i p t "  & ' & r     ( ) ( n     * + * 1    ��
�� 
psxp + o    ���� 	0 video   ) o      ���� 0 	videopath   '  , - , l   ��������  ��  ��   -  . / . l   �� 0 1��   0 % file command to get video stats    1 � 2 2 > f i l e   c o m m a n d   t o   g e t   v i d e o   s t a t s /  3 4 3 r     5 6 5 I   �� 7��
�� .sysoexecTEXT���     TEXT 7 b     8 9 8 m     : : � ; ; 
 f i l e   9 n     < = < 1    ��
�� 
strq = o    ���� 0 	videopath  ��   6 o      ���� 0 
videostats   4  > ? > l     ��������  ��  ��   ?  @ A @ l     �� B C��   B F @awk to get video width, height, frame rate and audio sample rate    C � D D � a w k   t o   g e t   v i d e o   w i d t h ,   h e i g h t ,   f r a m e   r a t e   a n d   a u d i o   s a m p l e   r a t e A  E F E r     - G H G I    +�� I��
�� .sysoexecTEXT���     TEXT I b     ' J K J b     % L M L m     ! N N � O O 
 e c h o   M n   ! $ P Q P 1   " $��
�� 
strq Q o   ! "���� 0 
videostats   K m   % & R R � S S � |   a w k   - F ' ,   '   ' { p r i n t   $ 3 , $ 4 , $ 7 } '   |   a w k   - F '   '   ' { p r i n t   $ 1 , $ 3 , $ 4 , $ 6 } '   |   a w k   ' { s u b ( / ~ / , " " ) ; p r i n t } '��   H o      ���� 0 	awkresult   F  T U T l  . .��������  ��  ��   U  V W V l  . .�� X Y��   X  global video variables    Y � Z Z , g l o b a l   v i d e o   v a r i a b l e s W  [ \ [ r   . 8 ] ^ ] c   . 4 _ ` _ n   . 2 a b a 4  / 2�� c
�� 
cwor c m   0 1����  b o   . /���� 0 	awkresult   ` m   2 3��
�� 
TEXT ^ o      ���� 0 
videowidth   \  d e d r   9 C f g f c   9 ? h i h n   9 = j k j 4  : =�� l
�� 
cwor l m   ; <����  k o   9 :���� 0 	awkresult   i m   = >��
�� 
TEXT g o      ���� 0 videoheight   e  m n m r   D N o p o c   D J q r q n   D H s t s 4  E H�� u
�� 
cwor u m   F G����  t o   D E���� 0 	awkresult   r m   H I��
�� 
TEXT p o      ���� 0 	framerate   n  v w v r   O [ x y x c   O W z { z n   O U | } | 4  P U�� ~
�� 
cwor ~ m   Q T����  } o   O P���� 0 	awkresult   { m   U V��
�� 
TEXT y o      ���� 0 audiosamplerate   w   �  r   \ c � � � m   \ _���� � � o      ���� 0 audiobitrate   �  � � � r   d k � � � m   d g����� � o      ���� 0 videobitrate   �  � � � r   l s � � � m   l o � � � � � D / U s e r s / d j w i l c o x / S i t e s / v i d e o / s t r e a m � o      ���� 0 outpath   �  � � � l  t t��������  ��  ��   �  � � � l  t t�� � ���   �VPdo shell script /Applications/VLC.app/Contents/MacOS/VLC -vvv -I dummy "$videopath" --sout=" #transcode{vcodec=h264,samplerate=$audiosamplerate,vb=$videobitrate,fps=$framerate,acodec=mp4a,ab=$audiobitrate,width=$videowidth,height=$videoheight,scale=1}:standard{access=file,mux=ts,dst='-'}" | mediastreamsegmenter -f $outputpath -t 30 -p    � � � �� d o   s h e l l   s c r i p t   / A p p l i c a t i o n s / V L C . a p p / C o n t e n t s / M a c O S / V L C   - v v v   - I   d u m m y   " $ v i d e o p a t h "   - - s o u t = "   # t r a n s c o d e { v c o d e c = h 2 6 4 , s a m p l e r a t e = $ a u d i o s a m p l e r a t e , v b = $ v i d e o b i t r a t e , f p s = $ f r a m e r a t e , a c o d e c = m p 4 a , a b = $ a u d i o b i t r a t e , w i d t h = $ v i d e o w i d t h , h e i g h t = $ v i d e o h e i g h t , s c a l e = 1 } : s t a n d a r d { a c c e s s = f i l e , m u x = t s , d s t = ' - ' } "   |   m e d i a s t r e a m s e g m e n t e r   - f   $ o u t p u t p a t h   - t   3 0   - p �  ��� � l  t t��������  ��  ��  ��    m      � ��                                                                                  MACS  alis    Z  Igor                       ɿ�7H+   l�
Finder.app                                                      � ɱ9t        ����  	                CoreServices    ɿ�'      ɱ9t     l� � �  +Igor:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p  
  I g o r  &System/Library/CoreServices/Finder.app  / ��  ��  ��     � � � l     ��������  ��  ��   �  ��� � l     ��������  ��  ��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ����� � ���
�� .aevtoappnull  �   � **** � k     v � �  
����  ��  ��   �   �  ��� �������� :������ N R������������������������ ���
�� 
prmp
�� .sysostdfalis    ��� null�� 	0 video  
�� 
psxp�� 0 	videopath  
�� 
strq
�� .sysoexecTEXT���     TEXT�� 0 
videostats  �� 0 	awkresult  
�� 
cwor
�� 
TEXT�� 0 
videowidth  �� 0 videoheight  �� 0 	framerate  �� �� 0 audiosamplerate  �� ��� 0 audiobitrate  ����� 0 videobitrate  �� 0 outpath  �� w� s*��l E�O��,E�O���,%j 	E�O���,%�%j 	E�O��k/�&E` O��l/�&E` O��m/�&E` O��a /�&E` Oa E` Oa E` Oa E` OPUascr  ��ޭ