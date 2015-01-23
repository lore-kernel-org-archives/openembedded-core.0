Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3F27B72C42
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 12:10:23 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q108so5659235qgd.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 04:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+IycptHJMr3e6qnjHjcxL+IAuhaeqFK6R0eFnQHJSxU=;
	b=eCkglj7xD4KrU6gQd/p33aP5CZGlpDFzJBRzme0hvFWN3p4NSAV+yRkS5V3mknB7sH
	3zCRfKYn3Klv5P+7O1V0M8y78cahyDGxGiV1uH1PQRnW5Dql/Wj12D2gj2ZIR4e3J+38
	hPdGzaHK0NJNjY6CWZ0TkGGiHCUnNga3Xqwwt+dhvI/pTs4fxKflGVsJfwOBYLQ02etI
	hDWAETcOJFKTR4pyB5NLjVCrMrzSMdKF0Tt+TO8p+zbwhX5ampANRWpxXkDqpo6BwQ0e
	fMJaCNe3+IUUG9YtYbjWMaGaOmOb8hY2lTNxLOXuqqWOSPxyUcD9O/btAP9RscZxGurt
	CMSQ==
X-Gm-Message-State: ALoCoQldquesdwO7j14Hks+bxs9MVl+9DCWi5DEch868bKOHnHPDIfD1HLryojReze60BW+9Lw5n
X-Received: by 10.224.7.197 with SMTP id e5mr7487412qae.64.1422015024126; Fri,
	23 Jan 2015 04:10:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 23 Jan 2015 04:10:03 -0800 (PST)
In-Reply-To: <8f53cf8ab078d83bbc29c3ed1e4dabe503e15151.1421976243.git.peter.seebach@windriver.com>
References: <cover.1421976243.git.peter.seebach@windriver.com>
	<8f53cf8ab078d83bbc29c3ed1e4dabe503e15151.1421976243.git.peter.seebach@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Jan 2015 12:10:03 +0000
Message-ID: <CAJTo0LZS1+CL=rxiHHm5m0aKKkvFD3AK4B1RZ_uFxRipYV7V6g@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.6.x.bb/pseudo_git.bb: Pseudo 1.6.4
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
X-List-Received-Date: Fri, 23 Jan 2015 12:10:31 -0000
Content-Type: multipart/alternative; boundary=001a11c223f460f1ab050d50ac40

--001a11c223f460f1ab050d50ac40
Content-Type: text/plain; charset=UTF-8

On 23 January 2015 at 02:23, Peter Seebach <peter.seebach@windriver.com>
wrote:

> pseudo 1.6.4 fixes a silly configure bug introduced with
> 1.6.3.
>

Thanks for the quick fix Peter :)

Ross

--001a11c223f460f1ab050d50ac40
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 January 2015 at 02:23, Peter Seebach <span dir=3D"ltr">&lt;<a href=3D=
"mailto:peter.seebach@windriver.com" target=3D"_blank">peter.seebach@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:7ht" class=3D"a3s" style=3D"overflow:hidden">pseudo 1.6.4 fixes a silly co=
nfigure bug introduced with<br>
1.6.3.<br></div></blockquote></div><br>Thanks for the quick fix Peter :)</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a11c223f460f1ab050d50ac40--
