Subject: ALTERNATIVE_LINK_NAME in bash recipe doesn't create /bin/sh
To: openembedded-core@lists.openembedded.org
From: "Devendra Tewari" <devendra.tewari@gmail.com>
X-Originating-Location: Recife, Pernambuco, BR (177.183.205.78)
X-Originating-Platform: Mac Safari 14.1
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 09 Aug 2021 13:42:44 -0700
Message-ID: <i9kg.1628541764875972527.mOQ9@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="246Iu27VfktFiYPRZhOm"

--246Iu27VfktFiYPRZhOm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I've added bash recipe (version 5.1.8) to a target but it does not seem to =
produce the /bin/sh link. I've checked that the recipe is supposed to provi=
de the following link

ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"

Is that by itself sufficient to produce the link? If so, it does not seem t=
o do so.

Thanks,
Devendra

--246Iu27VfktFiYPRZhOm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />I've added bash recipe (version 5.1.8) to a target but it=
 does not seem to produce the /bin/sh link. I've checked that the recipe is=
 supposed to provide the following link<br /><br />ALTERNATIVE_LINK_NAME[sh=
] =3D "${base_bindir}/sh"<br /><br />Is that by itself sufficient to produc=
e the link? If so, it does not seem to do so.<br /><br />Thanks,<br />Deven=
dra

--246Iu27VfktFiYPRZhOm--
