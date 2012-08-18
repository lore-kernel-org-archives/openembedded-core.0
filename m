Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T2mgb-0003iY-4f
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 19:19:45 +0200
Received: by eaad12 with SMTP id d12so1232280eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2012 10:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Wz3UpNtgyLYmR9nvJp8h4RwJeFvMiCM8BSfUWz3krLo=;
	b=TNHIu5Tds0Vey69hKBenCeZgRyNUtSawYP7Xg0fwh0rPDaBOwQBxjRIeH1LPnkVGD6
	w7zBBDPSVANPy6vZ2au4E4WT/emdpNeKzZbIKZZZK2ksZgZRFklH/mUcgXaXH2JV6Gyg
	546iKsMcBmcjjSShBIJ68Q+SNXgt/DYTlOJsNVBxM2Svs6956yjRV31/f9xNsYNqnHyn
	E0DnDItS2KS88zXGzTaAFQiE4V8qGElB7UohuyZ0H+Ifa/CE7NghKsTmPvx3g0ZZ5BeK
	exCHuRr0W4566wVKIaOM/Fep3u4TPIT/QVMxgCLc4+lSjGnR0Ti0/ff+YwDMuu0Y3uIp
	Vwyw==
Received: by 10.14.202.131 with SMTP id d3mr2000685eeo.32.1345309664796; Sat,
	18 Aug 2012 10:07:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Sat, 18 Aug 2012 10:07:14 -0700 (PDT)
In-Reply-To: <2197081.DenY8jTjx9@helios>
References: <1345265802-16783-1-git-send-email-raj.khem@gmail.com>
	<1345265802-16783-2-git-send-email-raj.khem@gmail.com>
	<2197081.DenY8jTjx9@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Aug 2012 10:07:14 -0700
Message-ID: <CAMKF1soin5OejpqiE-JKceJXP7109NT8i8wCFuDTahqJ66WGDQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] unifdef-native: Correct LICENSE
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
X-List-Received-Date: Sat, 18 Aug 2012 17:19:45 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 18, 2012 at 4:40 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Could we be more specific there and say LICENSE = "BSD-2-Clause" ?

Its more BSD-3-Clause actually. So I have sent a V2

Thx
-Khem


