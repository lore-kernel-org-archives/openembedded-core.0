Subject: Re: master/main branch renaming and bitbake
To: openembedded-core@lists.openembedded.org
From: "Benjamin Gilbert" <bgilbert@backtick.net>
X-Originating-Location: New York, New York, US (98.7.211.151)
X-Originating-Platform: Linux Firefox 88
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 13 May 2021 12:24:59 -0700
References: <CADkTA4OMd12mW9N37WtfUUHYZ=zQ9hsNb8sYanXU1q8MvLKj3w@mail.gmail.com>
In-Reply-To: <CADkTA4OMd12mW9N37WtfUUHYZ=zQ9hsNb8sYanXU1q8MvLKj3w@mail.gmail.com>
Message-ID: <1305.1620933899472438737@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ALp1bDDRVp6rghQCWZua"

--ALp1bDDRVp6rghQCWZua
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 12:04 PM, Bruce Ashfield wrote:

>=20
>=20
>> Deleting the branch penalizes existing developers, which projects might=
 be
>> willing to do. Git branch names don't usually have any effect on users.
>=20
> I'm not sure I see the distinction you are trying to draw.

Deleting the branch normally affects people who are in the project's devel=
oper community and pay attention to its announcements.=C2=A0 Those folks ca=
n then simply update their local checkouts and move on with their lives.=C2=
=
=A0 Everyone else just clones the default branch and maybe checks out a pa=
rticular tag or commit before building a package.=C2=A0 That workflow still=
 works after the default branch is renamed.=C2=A0 Bitbake's additional chec=
ks are unusual, and impose a long-term compatibility constraint on upstream=
 projects that they didn't sign up for.

--Benjamin Gilbert

--ALp1bDDRVp6rghQCWZua
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 12:04 PM, Bruce Ashfield wrote:<br />
<blockquote>
<blockquote>Deleting the branch penalizes existing developers, which proje=
cts might be willing to do. Git branch names don't usually have any effect =
on users.</blockquote>
I'm not sure I see the distinction you are trying to draw.</blockquote>
Deleting the branch normally affects people who are in the project's devel=
oper community and pay attention to its announcements.&nbsp; Those folks ca=
n then simply update their local checkouts and move on with their lives.&nb=
sp; Everyone else just clones the default branch and maybe checks out a par=
ticular tag or commit before building a package.&nbsp; That workflow still =
works after the default branch is renamed.&nbsp; Bitbake's additional check=
s are unusual, and impose a long-term compatibility constraint on upstream =
projects that they didn't sign up for.<br /><br />--Benjamin Gilbert

--ALp1bDDRVp6rghQCWZua--
