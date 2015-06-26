Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 36C5960132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 13:17:42 +0000 (UTC)
Received: by qgem68 with SMTP id m68so944475qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 06:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=f5bvPPPNbzdY0MlmCifK/L8JGxK5ikbcjiNDTOVi9OY=;
	b=IHbIL1OsyxSd36SXFjVEJ1a9limiK9MYdCYWUN0ii1OmM//Tk4hFiGB7jnp4PNEcsL
	IMxVQRAk8A/PB+ajSyyZxNWRYxnGSztKLo06j3JLu5YysP+JEIU8MVuV3dednpn4zmbI
	8RKOAO2HZn5VkfZeixTos0hnDIABbXXuief73BLQ6tJm9TE6fUdOtnvi3MWY1+c8Bpne
	DWAtpOho51Hh2aZz6GEaBqy6mqaA94adocnF6TspttQlDoSaACO4colY9RLnVVhRIRVR
	SP3F3ZD/0TWahzkT3Ktwa5xbPB+LFfV7cTVF7rl5A/fteoyx97xXv+xviCNtby0S3Udj
	LXVw==
X-Gm-Message-State: ALoCoQkeKnFR/469bK2A89fas6Z8kzKjGOBLv4BNGnYvSwVC3bCvi5iiY7twWDWvSUQWeolUifC7
X-Received: by 10.140.196.129 with SMTP id r123mr2142903qha.93.1435324663731; 
	Fri, 26 Jun 2015 06:17:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 26 Jun 2015 06:17:24 -0700 (PDT)
In-Reply-To: <558C5E43.6010709@linux.intel.com>
References: <558C5E43.6010709@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jun 2015 14:17:24 +0100
Message-ID: <CAJTo0LZ_zE0ZZcAaSRJyN6wN4rKH35oRwUj4bvkH1VOSfTy1uw@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Poky Project <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Automatic Upgrade Helper Announcement
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jun 2015 13:17:45 -0000
Content-Type: multipart/alternative; boundary=001a11433952b8316a05196b9043

--001a11433952b8316a05196b9043
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25 June 2015 at 21:02, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.=
com> wrote:

> I'm glad to announce the enabling of Automatic Upgrade Helper (a.k.a.
> AUH), the AUH is a service
> that provides recipe upgrades and will be run on weekly basis.
>

Excellent news, thanks Anibal for working on this!

(one day I'll figure out where i-acute is on my keyboard)

Ross

--001a11433952b8316a05196b9043
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 June 2015 at 21:02, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limon@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":3j1" class=3D"a3s" style=3D"overflow:hidden">I&#39;m glad to annou=
nce the enabling of Automatic Upgrade Helper (a.k.a. AUH), the AUH is a ser=
vice<br>
that provides recipe upgrades and will be run on weekly basis.<br></div></b=
lockquote></div><br>Excellent news, thanks Anibal for working on this!</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(one day I=
&#39;ll figure out where i-acute is on my keyboard)</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11433952b8316a05196b9043--
