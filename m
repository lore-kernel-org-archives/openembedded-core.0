Received: from mail-vb0-f46.google.com ([209.85.212.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hirst689@gmail.com>) id 1UPVrc-0001Rk-Fk
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 12:33:21 +0200
Received: by mail-vb0-f46.google.com with SMTP id 11so4497367vbe.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 03:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=SCcqDAFb1YQRCdHtdLxzBlcW5lnlSvJsBGDqM5soZig=;
	b=NO3FiyGCs/Yvb3erCKloAo7YxES7dtpmyM3s04F1RJdD7jdfzn4mGnVSIA/YW7Rxbv
	jI7wFU8kgGjKyrrz6EKHZo9SAvh5GRPaU47BZygcr4+tZq8xDJcif2y6GEtehSzF8A1U
	FpW4ivZvHqEFFa4Tbd4Xwmnb/VjdLfsCYhb6B5Q3IuXblSEd/SFNqGulyGqUZ+lNMRmR
	lh+JlY/dI2gzKAYd3eVyEwtRxAk1P9/zO/pUouXkolZX6NbYv4hbXfQcuq1HMw/BWBs+
	+rESY/MK9KjFnMV0ebPZ0BBdwxBSan0rlyReuBlLZYD9dDfAyFgn68evQD8nhpI41Lcm
	P4Nw==
MIME-Version: 1.0
X-Received: by 10.220.161.4 with SMTP id p4mr18845457vcx.32.1365502560319;
	Tue, 09 Apr 2013 03:16:00 -0700 (PDT)
Received: by 10.59.11.37 with HTTP; Tue, 9 Apr 2013 03:16:00 -0700 (PDT)
Date: Tue, 9 Apr 2013 06:16:00 -0400
Message-ID: <CAHu+ux0pWKar5pRvsdqkPXq2E2A4+oBRmMqO8W7=h-iX2iKh9w@mail.gmail.com>
From: David Hirst <hirst689@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Achiving My OE environment
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
X-List-Received-Date: Tue, 09 Apr 2013 10:33:25 -0000
Content-Type: multipart/alternative; boundary=001a11c206320c990d04d9ead7ea

--001a11c206320c990d04d9ead7ea
Content-Type: text/plain; charset=ISO-8859-1

I am trying to achive (svn or tar ball) my whole oe_layersetup directory
structure.
However I seem to have problems when I check it out or untar it on a
different machine.
It does not seems to build correctly. I set up the paths to the build tools
and use /conf/setenv
to set up other paths.
It seems impossible to build everything correctly without going through a
comlete installation of the oe-layersetup form the git clone and setup
script. Does anyone have experiance with this? and have some advice?

Thanks

-- 
David Hirst
hirst689@gmail.com

--001a11c206320c990d04d9ead7ea
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am trying to achive (svn or tar ball) my whole oe_l=
ayersetup directory structure.</div><div>However I seem to have problems wh=
en I check it out or untar it on a different machine.</div><div>It does not=
 seems to build correctly. I set up the paths to the build tools and use /c=
onf/setenv<br clear=3D"all">
to set up other paths.</div><div>It seems impossible to build everything co=
rrectly without going through a comlete installation of the oe-layersetup f=
orm the git clone and setup script. Does anyone have experiance with this? =
and have some advice?</div>
<div>=A0</div><div>Thanks</div><div>=A0</div><div>-- <br>David Hirst<br><a =
href=3D"mailto:hirst689@gmail.com" target=3D"_blank">hirst689@gmail.com</a>=
<br><img alt=3D""><br>
</div></div>

--001a11c206320c990d04d9ead7ea--
