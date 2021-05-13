Subject: Re: master/main branch renaming and bitbake
To: openembedded-core@lists.openembedded.org
From: "Benjamin Gilbert" <bgilbert@backtick.net>
X-Originating-Location: New York, New York, US (98.7.211.151)
X-Originating-Platform: Linux Firefox 88
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 13 May 2021 13:41:30 -0700
References: <7ebd5f52982311726a6aebd89eba9cae07bdf999.camel@linuxfoundation.org>
In-Reply-To: <7ebd5f52982311726a6aebd89eba9cae07bdf999.camel@linuxfoundation.org>
Message-ID: <5132.1620938490195007398@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="6evjHiMkazABfYlt8eKF"

--6evjHiMkazABfYlt8eKF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 01:09 PM, Richard Purdie wrote:

>=20
> Some of our users have complained, yes. That isn't a conscious decision =
on
>=20
> "our" part, just a rather unfortunate and unplanned consequence of the
> fact
> we're pretty strict about declaring where we get our sources.
>=20
> The advice to anyone hitting this issue is to add in the correct branch
> to the SRC_URI. It is simple and easy to do, can be in bbappends
> or even changed via anonymous python and similar if necessary. We've
> already
> found the issue with several core recipes, we simply updated them and mo=
st
>=20
> users didn't notice. I would even likely take that kind of change into
> older
> otherwise unmaintained branches and I think I did so in at least one cas=
e
> in
> the past.
>=20
> There is no intent to peanlize or complain, my intent is just to deal wi=
th
>=20
> it like any other upstream source change, these things happen all the
> time.
> I am stating that here for any other maintainers to read and suggest the=
y
> follow oe-core's lead.

Whoops, just saw this.=C2=A0 Thanks for the position statement, Richard; v=
ery much appreciated.

Best,
--Benjamin Gilbert

--6evjHiMkazABfYlt8eKF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 01:09 PM, Richard Purdie wrote:<br />
<blockquote>Some of our users have complained, yes. That isn't a conscious=
 decision on&nbsp;<br />"our" part, just a rather unfortunate and unplanned=
 consequence of the fact<br />we're pretty strict about declaring where we =
get our sources.<br /><br />The advice to anyone hitting this issue is to a=
dd in the correct branch<br />to the SRC_URI. It is simple and easy to do, =
can be in bbappends <br />or even changed via anonymous python and similar =
if necessary. We've already<br />found the issue with several core recipes,=
 we simply updated them and most&nbsp;<br />users didn't notice. I would ev=
en likely take that kind of change into older<br />otherwise unmaintained b=
ranches and I think I did so in at least one case in<br />the past.<br /><b=
r />There is no intent to peanlize or complain, my intent is just to deal w=
ith<br />it like any other upstream source change, these things happen all =
the time.&nbsp;<br />I am stating that here for any other maintainers to re=
ad and suggest they&nbsp;<br />follow oe-core's lead.</blockquote>
Whoops, just saw this.&nbsp; Thanks for the position statement, Richard; v=
ery much appreciated.<br /><br />Best,<br />--Benjamin Gilbert

--6evjHiMkazABfYlt8eKF--
