PGDMP     
                    y            FreshCafeteria    13.0    13.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17156    FreshCafeteria    DATABASE     t   CREATE DATABASE "FreshCafeteria" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
     DROP DATABASE "FreshCafeteria";
                postgres    false            �          0    17165    ar_internal_metadata 
   TABLE DATA           R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public          postgres    false    201   �                  0    17234 	   foodcarts 
   TABLE DATA           H   COPY public.foodcarts (id, user_id, created_at, updated_at) FROM stdin;
    public          postgres    false    213   �                 0    17245    foodcarts_items 
   TABLE DATA           u   COPY public.foodcarts_items (id, quantity, menu_categories_item_id, created_at, updated_at, foodcart_id) FROM stdin;
    public          postgres    false    215   �       �          0    17187    menu_categories 
   TABLE DATA           V   COPY public.menu_categories (id, name, is_active, created_at, updated_at) FROM stdin;
    public          postgres    false    205   �       �          0    17198    menu_categories_items 
   TABLE DATA           �   COPY public.menu_categories_items (id, name, price, description, is_available, created_at, updated_at, menu_category_id) FROM stdin;
    public          postgres    false    207   w       �          0    17209    orders 
   TABLE DATA           i   COPY public.orders (id, completed, user_id, created_at, updated_at, "totalPrice", is_walkin) FROM stdin;
    public          postgres    false    209   I       �          0    17226    orders_items 
   TABLE DATA           o   COPY public.orders_items (id, order_id, menu_categories_item_id, created_at, updated_at, quantity) FROM stdin;
    public          postgres    false    211   �       �          0    17157    schema_migrations 
   TABLE DATA           4   COPY public.schema_migrations (version) FROM stdin;
    public          postgres    false    200   �       �          0    17175    users 
   TABLE DATA           t   COPY public.users (id, name, email, password_digest, is_admin, is_clirk, created_at, updated_at, phone) FROM stdin;
    public          postgres    false    203                     0    0    foodcarts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.foodcarts_id_seq', 11, true);
          public          postgres    false    212                       0    0    foodcarts_items_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.foodcarts_items_id_seq', 96, true);
          public          postgres    false    214                       0    0    menu_categories_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.menu_categories_id_seq', 4, true);
          public          postgres    false    204                       0    0    menu_categories_items_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.menu_categories_items_id_seq', 8, true);
          public          postgres    false    206                       0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 13, true);
          public          postgres    false    208                       0    0    orders_items_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_items_id_seq', 17, true);
          public          postgres    false    210                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 23, true);
          public          postgres    false    202            �   ?   x�K�+�,���M�+�LI-K��/ ���uLt��LͭL-����M-�Hq��qqq ��\          �   x�}�ˑ!�5D�	<��G�X&�8�^�n��-)�&�(>���,X�75M�����2s���_�Kf�ˢE��8;����²l�������;��h:l�8wBl�R�-�t�� �ݵ�U����I�����}��<�'���(�-!s�@|g�n�e~Ǿ���ob���k�K�ϵ�و8�4f�+;x�            x������ � �      �      x�m�=�0@�9>�/P�v����#C�XZ����$:?�ӓr�o�U�U&����zV#��#����l����������CэHv�pe�Q*YX���������f�&1��a��. /�)�      �   �   x�}����0D��W����u�9p�#'.U)K���=����"U�a4��h�}���6+h�m���hi�<C�(�J$6�T��I�*�]��GA���;��������24�4~[6}����+k���So�8L!V��2�cj;�8��@��c튥�D}=���R^�G��ވ���/�4�X��N��.��z ��TJ      �   -  x�}��q�0E�Tj���"R�Ϯ��O@�II��j������zCZ1��@�ȸH��.���W�:��[p�U�1~��A��W����C��uӠ�T��Նv�l����j7!#�=�e�(�����b�8I}vD���IziةF�e��c0�лvӏ��"tAO�#B��D�3�86�s�����YLB��&�:�z_k���Zo].�-�M�s!ډT�ͥ�������.�e��2�+�;�CB�ۈ�إ=<+"bm������nu����W�y,wX��.Ф%      �     x�}��q!�Q��Qz� ���Z���۽�wOk(ҼISVy2����ǆ�P��
�����6�kHĪ�Ҿ�DL�a%"�{�-��*$�i_�_[P���h+���q۲:|�Y���}NL�7S_�V�S��¹�>�U!�H{~�@�		�~���U#i9�������[G����2m9o!�l�їB�+�Ƿÿ	AQ���W�'?�_������|�o�_D2݄�@�H����KlH8��:}D���      �   i   x�MϱCA����6p���H~�@��l��G��Q�|����0Ar�0���Jn���Q1�Ǫa�m��R�ʹ޼6��A_��L���,�'��8��9��5�      �   x  x�}�Y��\���Wx�w���
�p5�(*.���	��в��\:�t��	�:ɛ��T�UD��w�utK���K��=щC�w�@�' ?�� IH��=��z�2�o{��V���]~����^�$��X��8ƭ$���H����a���I��K#��w2;FA��/L�
����H8�=� ��CbA�yɶjyi&8����U�G�M�J�����t�9��T��Lr%M^ăi�aoM7�g�G��#�\R(�� 3��g��\&a	R�ɕ��cHM���~9h�]ڲ��Qg1�b���m(8�j\p~�n�}��9�j���e���$���S�T�S�v�KJ�sm��܌��~���.�������1�Q������v�
GN�Ec�&��=�#@�\d2ǜ=� ��6K�������6d�����^�Q>�n{Xx��t�z��$�U�W`��>	�0�`(�FϤO,&�e��v�r�l?�OA���:*�{N�#kM��z��]:���|x[u���P#iI��nNgZ���!'9;�`Z����[w?O�۰�S/��s~�Iy4i"l�&\�&��[�7
�˃fe�ș[H܇~;7C�����&^��}g�
�D�I���W�lsYQ�Z�E�	�k��3��w{.aUã�o,r��a�5�gV���do����Cmc���-?W��� �W
�"� ���Y�3J�4�&眧�=ݩSD��2�1�Nԫ큞,M�׊���PU�p����!�^jXn���Wp����$&��?I�OR �L���)D��#�r�TՋ;ɲr+�#F�}�Β�Z����L5�_�<�>~�C���10b�]�|Nv���os��+ *���/���C�E��ň�zP�M�T*Ġ��     