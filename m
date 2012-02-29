Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2YEm-00036Y-QX
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 02:21:48 +0100
Received: by vbbfr13 with SMTP id fr13so2610343vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 17:13:20 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.66.228 as permitted sender) client-ip=10.52.66.228; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.66.228 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.66.228])
	by 10.52.66.228 with SMTP id i4mr15774997vdt.12.1330478000471 (num_hops
	= 1); Tue, 28 Feb 2012 17:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=b8J4fOIquvumNgjW6UQIXd5wEVkBde2k+VcEa68rkLA=;
	b=ArR4vdm+cto7poSPWT0egoiyCdYN+jwH2bwabHchIA1hYV4XcYizGRwzyo8jwI8iIe
	sJdRRQBwmefKRAPDhf3M767XUEcY0xH4TbyCV5eOQ2AR6PW/sNhQO6JgT/bc5mbxkByp
	yKATmqzyydvtNMpy2jwLS8lKnxHdMIX9j3e20=
MIME-Version: 1.0
Received: by 10.52.66.228 with SMTP id i4mr13036143vdt.12.1330478000090; Tue,
	28 Feb 2012 17:13:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Tue, 28 Feb 2012 17:13:20 -0800 (PST)
In-Reply-To: <0d6796d36dede0968c1f164e05f9be2969f3b29d.1330474667.git.elizabeth.flanagan@intel.com>
References: <cover.1330474667.git.elizabeth.flanagan@intel.com>
	<0d6796d36dede0968c1f164e05f9be2969f3b29d.1330474667.git.elizabeth.flanagan@intel.com>
Date: Tue, 28 Feb 2012 22:13:20 -0300
X-Google-Sender-Auth: vIZyGdipJ4NfYp_nKTPCsf_wufA
Message-ID: <CAP9ODKqisZf0uZ7bmfHOXsVg3dRUGt-nzHCiOU8Osa7g-1wVPg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bootimg.bbclass: Quoting fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Feb 2012 01:21:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2012 at 21:23, Beth Flanagan
<elizabeth.flanagan@intel.com> wrote:
> More quoting issues during an fri build. Fixing as per standard.

Already done by Saul :)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


