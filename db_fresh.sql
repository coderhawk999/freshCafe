PGDMP     1                    y            FreshCafeteria    13.0    13.0 >               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17156    FreshCafeteria    DATABASE     t   CREATE DATABASE "FreshCafeteria" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
     DROP DATABASE "FreshCafeteria";
                postgres    false            �            1259    17165    ar_internal_metadata    TABLE     �   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         heap    postgres    false            �            1259    17234 	   foodcarts    TABLE     �   CREATE TABLE public.foodcarts (
    id bigint NOT NULL,
    user_id character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.foodcarts;
       public         heap    postgres    false            �            1259    17232    foodcarts_id_seq    SEQUENCE     y   CREATE SEQUENCE public.foodcarts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.foodcarts_id_seq;
       public          postgres    false    213            	           0    0    foodcarts_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.foodcarts_id_seq OWNED BY public.foodcarts.id;
          public          postgres    false    212            �            1259    17245    foodcarts_items    TABLE       CREATE TABLE public.foodcarts_items (
    id bigint NOT NULL,
    quantity bigint,
    menu_categories_item_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    foodcart_id bigint
);
 #   DROP TABLE public.foodcarts_items;
       public         heap    postgres    false            �            1259    17243    foodcarts_items_id_seq    SEQUENCE        CREATE SEQUENCE public.foodcarts_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.foodcarts_items_id_seq;
       public          postgres    false    215            
           0    0    foodcarts_items_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.foodcarts_items_id_seq OWNED BY public.foodcarts_items.id;
          public          postgres    false    214            �            1259    17187    menu_categories    TABLE     �   CREATE TABLE public.menu_categories (
    id bigint NOT NULL,
    name character varying,
    is_active boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
 #   DROP TABLE public.menu_categories;
       public         heap    postgres    false            �            1259    17185    menu_categories_id_seq    SEQUENCE        CREATE SEQUENCE public.menu_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.menu_categories_id_seq;
       public          postgres    false    205                       0    0    menu_categories_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.menu_categories_id_seq OWNED BY public.menu_categories.id;
          public          postgres    false    204            �            1259    17198    menu_categories_items    TABLE     1  CREATE TABLE public.menu_categories_items (
    id bigint NOT NULL,
    name character varying,
    price bigint,
    description text,
    is_available boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    menu_category_id bigint
);
 )   DROP TABLE public.menu_categories_items;
       public         heap    postgres    false            �            1259    17196    menu_categories_items_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_categories_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.menu_categories_items_id_seq;
       public          postgres    false    207                       0    0    menu_categories_items_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.menu_categories_items_id_seq OWNED BY public.menu_categories_items.id;
          public          postgres    false    206            �            1259    17209    orders    TABLE       CREATE TABLE public.orders (
    id bigint NOT NULL,
    completed boolean,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    "totalPrice" bigint,
    is_walkin boolean
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    17207    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    209                       0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    208            �            1259    17226    orders_items    TABLE     �   CREATE TABLE public.orders_items (
    id bigint NOT NULL,
    order_id bigint,
    menu_categories_item_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    quantity bigint
);
     DROP TABLE public.orders_items;
       public         heap    postgres    false            �            1259    17224    orders_items_id_seq    SEQUENCE     |   CREATE SEQUENCE public.orders_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_items_id_seq;
       public          postgres    false    211                       0    0    orders_items_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_items_id_seq OWNED BY public.orders_items.id;
          public          postgres    false    210            �            1259    17157    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         heap    postgres    false            �            1259    17175    users    TABLE     B  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    password_digest character varying,
    is_admin boolean,
    is_clirk boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    phone text
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17173    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    203                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    202            Z           2604    17237    foodcarts id    DEFAULT     l   ALTER TABLE ONLY public.foodcarts ALTER COLUMN id SET DEFAULT nextval('public.foodcarts_id_seq'::regclass);
 ;   ALTER TABLE public.foodcarts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            [           2604    17248    foodcarts_items id    DEFAULT     x   ALTER TABLE ONLY public.foodcarts_items ALTER COLUMN id SET DEFAULT nextval('public.foodcarts_items_id_seq'::regclass);
 A   ALTER TABLE public.foodcarts_items ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            V           2604    17190    menu_categories id    DEFAULT     x   ALTER TABLE ONLY public.menu_categories ALTER COLUMN id SET DEFAULT nextval('public.menu_categories_id_seq'::regclass);
 A   ALTER TABLE public.menu_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            W           2604    17201    menu_categories_items id    DEFAULT     �   ALTER TABLE ONLY public.menu_categories_items ALTER COLUMN id SET DEFAULT nextval('public.menu_categories_items_id_seq'::regclass);
 G   ALTER TABLE public.menu_categories_items ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            X           2604    17212 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            Y           2604    17229    orders_items id    DEFAULT     r   ALTER TABLE ONLY public.orders_items ALTER COLUMN id SET DEFAULT nextval('public.orders_items_id_seq'::regclass);
 >   ALTER TABLE public.orders_items ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            U           2604    17178    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �          0    17165    ar_internal_metadata 
   TABLE DATA           R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public          postgres    false    201   �G                  0    17234 	   foodcarts 
   TABLE DATA           H   COPY public.foodcarts (id, user_id, created_at, updated_at) FROM stdin;
    public          postgres    false    213   H                 0    17245    foodcarts_items 
   TABLE DATA           u   COPY public.foodcarts_items (id, quantity, menu_categories_item_id, created_at, updated_at, foodcart_id) FROM stdin;
    public          postgres    false    215   �H       �          0    17187    menu_categories 
   TABLE DATA           V   COPY public.menu_categories (id, name, is_active, created_at, updated_at) FROM stdin;
    public          postgres    false    205   �H       �          0    17198    menu_categories_items 
   TABLE DATA           �   COPY public.menu_categories_items (id, name, price, description, is_available, created_at, updated_at, menu_category_id) FROM stdin;
    public          postgres    false    207   }I       �          0    17209    orders 
   TABLE DATA           i   COPY public.orders (id, completed, user_id, created_at, updated_at, "totalPrice", is_walkin) FROM stdin;
    public          postgres    false    209   OJ       �          0    17226    orders_items 
   TABLE DATA           o   COPY public.orders_items (id, order_id, menu_categories_item_id, created_at, updated_at, quantity) FROM stdin;
    public          postgres    false    211   �K       �          0    17157    schema_migrations 
   TABLE DATA           4   COPY public.schema_migrations (version) FROM stdin;
    public          postgres    false    200   �L       �          0    17175    users 
   TABLE DATA           t   COPY public.users (id, name, email, password_digest, is_admin, is_clirk, created_at, updated_at, phone) FROM stdin;
    public          postgres    false    203   M                  0    0    foodcarts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.foodcarts_id_seq', 11, true);
          public          postgres    false    212                       0    0    foodcarts_items_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.foodcarts_items_id_seq', 96, true);
          public          postgres    false    214                       0    0    menu_categories_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.menu_categories_id_seq', 4, true);
          public          postgres    false    204                       0    0    menu_categories_items_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.menu_categories_items_id_seq', 8, true);
          public          postgres    false    206                       0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 13, true);
          public          postgres    false    208                       0    0    orders_items_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_items_id_seq', 17, true);
          public          postgres    false    210                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 23, true);
          public          postgres    false    202            _           2606    17172 .   ar_internal_metadata ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public            postgres    false    201            o           2606    17250 $   foodcarts_items foodcarts_items_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.foodcarts_items
    ADD CONSTRAINT foodcarts_items_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.foodcarts_items DROP CONSTRAINT foodcarts_items_pkey;
       public            postgres    false    215            m           2606    17242    foodcarts foodcarts_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.foodcarts
    ADD CONSTRAINT foodcarts_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.foodcarts DROP CONSTRAINT foodcarts_pkey;
       public            postgres    false    213            f           2606    17206 0   menu_categories_items menu_categories_items_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.menu_categories_items
    ADD CONSTRAINT menu_categories_items_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.menu_categories_items DROP CONSTRAINT menu_categories_items_pkey;
       public            postgres    false    207            d           2606    17195 $   menu_categories menu_categories_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.menu_categories
    ADD CONSTRAINT menu_categories_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.menu_categories DROP CONSTRAINT menu_categories_pkey;
       public            postgres    false    205            k           2606    17231    orders_items orders_items_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.orders_items
    ADD CONSTRAINT orders_items_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.orders_items DROP CONSTRAINT orders_items_pkey;
       public            postgres    false    211            i           2606    17214    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    209            ]           2606    17164 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            postgres    false    200            b           2606    17183    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203            g           1259    17220    index_orders_on_user_id    INDEX     M   CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);
 +   DROP INDEX public.index_orders_on_user_id;
       public            postgres    false    209            `           1259    17184    index_users_on_email    INDEX     N   CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);
 (   DROP INDEX public.index_users_on_email;
       public            postgres    false    203            p           2606    17215    orders fk_rails_f868b47f6a    FK CONSTRAINT     y   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_rails_f868b47f6a;
       public          postgres    false    209    2914    203            �   ?   x�K�+�,���M�+�LI-K��/ ���uLt��LͭL-����M-�Hq��qqq ��\          �   x�}�ˑ!�5D�	<��G�X&�8�^�n��-)�&�(>���,X�75M�����2s���_�Kf�ˢE��8;����²l�������;��h:l�8wBl�R�-�t�� �ݵ�U����I�����}��<�'���(�-!s�@|g�n�e~Ǿ���ob���k�K�ϵ�و8�4f�+;x�            x������ � �      �      x�m�=�0@�9>�/P�v����#C�XZ����$:?�ӓr�o�U�U&����zV#��#����l����������CэHv�pe�Q*YX���������f�&1��a��. /�)�      �   �   x�}����0D��W����u�9p�#'.U)K���=����"U�a4��h�}���6+h�m���hi�<C�(�J$6�T��I�*�]��GA���;��������24�4~[6}����+k���So�8L!V��2�cj;�8��@��c튥�D}=���R^�G��ވ���/�4�X��N��.��z ��TJ      �   -  x�}��q�0E�Tj���"R�Ϯ��O@�II��j������zCZ1��@�ȸH��.���W�:��[p�U�1~��A��W����C��uӠ�T��Նv�l����j7!#�=�e�(�����b�8I}vD���IziةF�e��c0�лvӏ��"tAO�#B��D�3�86�s�����YLB��&�:�z_k���Zo].�-�M�s!ډT�ͥ�������.�e��2�+�;�CB�ۈ�إ=<+"bm������nu����W�y,wX��.Ф%      �     x�}��q!�Q��Qz� ���Z���۽�wOk(ҼISVy2����ǆ�P��
�����6�kHĪ�Ҿ�DL�a%"�{�-��*$�i_�_[P���h+���q۲:|�Y���}NL�7S_�V�S��¹�>�U!�H{~�@�		�~���U#i9�������[G����2m9o!�l�їB�+�Ƿÿ	AQ���W�'?�_������|�o�_D2݄�@�H����KlH8��:}D���      �   i   x�MϱCA����6p���H~�@��l��G��Q�|����0Ar�0���Jn���Q1�Ǫa�m��R�ʹ޼6��A_��L���,�'��8��9��5�      �   x  x�}�Y��\���Wx�w���
�p5�(*.���	��в��\:�t��	�:ɛ��T�UD��w�utK���K��=щC�w�@�' ?�� IH��=��z�2�o{��V���]~����^�$��X��8ƭ$���H����a���I��K#��w2;FA��/L�
����H8�=� ��CbA�yɶjyi&8����U�G�M�J�����t�9��T��Lr%M^ăi�aoM7�g�G��#�\R(�� 3��g��\&a	R�ɕ��cHM���~9h�]ڲ��Qg1�b���m(8�j\p~�n�}��9�j���e���$���S�T�S�v�KJ�sm��܌��~���.�������1�Q������v�
GN�Ec�&��=�#@�\d2ǜ=� ��6K�������6d�����^�Q>�n{Xx��t�z��$�U�W`��>	�0�`(�FϤO,&�e��v�r�l?�OA���:*�{N�#kM��z��]:���|x[u���P#iI��nNgZ���!'9;�`Z����[w?O�۰�S/��s~�Iy4i"l�&\�&��[�7
�˃fe�ș[H܇~;7C�����&^��}g�
�D�I���W�lsYQ�Z�E�	�k��3��w{.aUã�o,r��a�5�gV���do����Cmc���-?W��� �W
�"� ���Y�3J�4�&眧�=ݩSD��2�1�Nԫ큞,M�׊���PU�p����!�^jXn���Wp����$&��?I�OR �L���)D��#�r�TՋ;ɲr+�#F�}�Β�Z����L5�_�<�>~�C���10b�]�|Nv���os��+ *���/���C�E��ň�zP�M�T*Ġ��     