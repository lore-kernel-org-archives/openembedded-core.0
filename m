Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Txqud-00031l-2L
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 04:22:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0N36aQ3005788
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jan 2013 19:06:36 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 22 Jan 2013 19:06:34 -0800
Message-ID: <50FF5408.1040601@windriver.com>
Date: Wed, 23 Jan 2013 11:07:52 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1358763271.git.kai.kang@windriver.com>
	<CAJTo0LZhpvRd7oR6n7gVbP1n6=YuqqT_CHoa6ozs8WiK7w3KWQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZhpvRd7oR6n7gVbP1n6=YuqqT_CHoa6ozs8WiK7w3KWQ@mail.gmail.com>
X-Originating-IP: [128.224.162.205]
Cc: scott.a.garman@intel.com, Zhenfeng.Zhao@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Upgrade perl to 5.14.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 03:22:08 -0000
X-List-Received-Date: Wed, 23 Jan 2013 03:22:08 -0000
Content-Type: multipart/alternative;
	boundary="------------030505010906090301060000"

--------------030505010906090301060000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id r0N36aQ3005788

On 2013=E5=B9=B401=E6=9C=8822=E6=97=A5 23:30, Burton, Ross wrote:
>  On 22 January 2013 02:14, Kang Kai <kai.kang@windriver.com> wrote:
> > Kang Kai (2): perl-native: update to 5.14.3: perl: update to
> > 5.14.3
>
>  Does this need to happen in Danny too? (although that would have to
>  be a patch and not a version upgrade)

This update is for security issue, and target milestone is 1.3.1 in=20
bugzilla:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3701

So I suppose that Danny need it.

Regards,
Kai

>
>
>  Ross
>



--------------030505010906090301060000
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id r0N36aQ3005788

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    On 2013=E5=B9=B401=E6=9C=8822=E6=97=A5 23:30, Burton, Ross wrote:<br>
    <span style=3D"white-space: pre;">&gt; On 22 January 2013 02:14, Kang
      Kai <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang@wind=
river.com">&lt;kai.kang@windriver.com&gt;</a> wrote:<br>
      &gt;&gt; Kang Kai (2): perl-native: update to 5.14.3: perl: update
      to<br>
      &gt;&gt; 5.14.3<br>
      &gt; <br>
      &gt; Does this need to happen in Danny too? (although that would
      have to<br>
      &gt; be a patch and not a version upgrade)</span><br>
    <br>
    This update is for security issue, and target milestone is 1.3.1 in
    bugzilla:<br>
    <a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.yoctoproj=
ect.org/show_bug.cgi?id=3D3701">https://bugzilla.yoctoproject.org/show_bu=
g.cgi?id=3D3701</a><br>
    <br>
    So I suppose that Danny need it.<br>
    <br>
    Regards,<br>
    Kai<br>
    <br>
    <span style=3D"white-space: pre;">&gt; <br>
      &gt; <br>
      &gt; Ross<br>
      &gt; </span><br>
    <br>
    <br>
  </body>
</html>

--------------030505010906090301060000--
