Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id ABE9075C82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:56:18 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so9488193qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hnALOu64oETZMo53+ed1rKjKdVMfqUdE0OE4BB7EhME=;
	b=VH7dQW0romlVRwi4cP6ezfTTdXSjySwqP4tqCJd6iPeqm1Gs69YFhLonaiETjsV90U
	9lovy6pq1RxC0tfSdMC40LVd9pNk5FiwXQgtcyUBANsBwbg87Xz40KAwF+5fSjtz0dm6
	FJI9hcm+Uvwny1ou7T1YrIHMHGOxy+C+STIVmkoJO00i90S6sjvTMjPAfN/SLQazFShT
	S8Xaj1oNyvP9gjLV+qRDe68bqK8qfAia24gNNHY+q7tB+OIpugsx0K6cIbmb+yRhwAYm
	+X5/txg9bWu/4cbQpDQEcfLe2+dscFTPLaJQVHUa3TA0RECKgMd2geP/7Jvy2VYmZ9g3
	d/fg==
X-Gm-Message-State: ALoCoQlsGi6oSKAsdi/xgrnZLXA+rwueGmE+cLc6/knr0uwpro1i9bWrv5oBBJM9SoHVJH7AuAMu
X-Received: by 10.140.231.19 with SMTP id b19mr27372153qhc.22.1435679779677;
	Tue, 30 Jun 2015 08:56:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 08:55:59 -0700 (PDT)
In-Reply-To: <9445f8200ebe59ee467ee0af8763fbc886f579d7.1434464336.git.jussi.kukkonen@intel.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
	<9445f8200ebe59ee467ee0af8763fbc886f579d7.1434464336.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 16:55:59 +0100
Message-ID: <CAJTo0LZLWUA34KpL683ZSuu4Rb861YotwJUGWaVU9_4c+eCuLw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/6] gtk+3: Upgrade to 3.16.3
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
X-List-Received-Date: Tue, 30 Jun 2015 15:56:20 -0000
Content-Type: multipart/alternative; boundary=001a11c12f004789500519be3f20

--001a11c12f004789500519be3f20
Content-Type: text/plain; charset=UTF-8

On 16 June 2015 at 15:22, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> * Package new binaries gtk3-icon-browser and gtk-encode-symbolic-svg
>

Should encode-symbolic-svg be in the -dev package?

Ross

--001a11c12f004789500519be3f20
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2015 at 15:22, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ad" cl=
ass=3D"a3s" style=3D"overflow:hidden">* Package new binaries <span class=3D=
"il">gtk3</span>-icon-browser and <span class=3D"il">gtk</span>-encode-symb=
olic-svg<br></div></blockquote></div><br>Should encode-symbolic-svg be in t=
he -dev package?</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a11c12f004789500519be3f20--
