Subject: Re: [PATCH 2/2] boost: revert 1.72.0 regression
To: openembedded-core@lists.openembedded.org
From: "Andrew Geissler" <geissonator@gmail.com>
X-Originating-Location: Austin, Texas, US (45.18.127.186)
X-Originating-Platform: Mac Firefox 75
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 21 Apr 2020 12:31:26 -0700
References: <CANNYZj_PYZSmYSdYUytQOYHJw+P=1M26nfzy7crQ0-X3MRvfRg@mail.gmail.com>
In-Reply-To: <CANNYZj_PYZSmYSdYUytQOYHJw+P=1M26nfzy7crQ0-X3MRvfRg@mail.gmail.com>
Message-ID: <21679.1587497486653997697@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="MFM2PkZXJpatZ1Uj1Dwi"

--MFM2PkZXJpatZ1Uj1Dwi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> The patch needs an Upstream-Status. Is it a backport (then the link to
> repo needs to be provided)?

Thanks for the quick review Alexander. My understanding is that boost rele=
ased 1.72.0 and then found this regression so they provide a link to this p=
atch on their 1.72.0 release page.

Here's a link to the upstream revert commit:
https://github.com/boostorg/coroutine/commit/9c73b2f7c1759a9508ba8780b38dc=
15f07f1a447

I saw an automated response from patchwork asking for a Signed-off-by tag =
for the patch but since the upstream commit does not have it, not sure what=
 to do?

--MFM2PkZXJpatZ1Uj1Dwi
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>The patch needs an Upstream-Status. Is it a backport (then the =
link to repo needs to be provided)?</blockquote>
Thanks for the quick review Alexander. My understanding is that boost rele=
ased 1.72.0 and then found this regression so they provide a link to this p=
atch on their 1.72.0 release page.<br /><br />Here's a link to the upstream=
 revert commit:<br />https://github.com/boostorg/coroutine/commit/9c73b2f7c=
1759a9508ba8780b38dc15f07f1a447<br /><br />I saw an automated response from=
 patchwork asking for a Signed-off-by tag for the patch but since the upstr=
eam commit does not have it, not sure what to do?

--MFM2PkZXJpatZ1Uj1Dwi--
