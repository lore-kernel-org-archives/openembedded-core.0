Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 18EA877097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 12:13:15 +0000 (UTC)
Received: by qgbb65 with SMTP id b65so49506238qgb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 05:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8Gp61jydLEvDol3RxeGITxcnul/gDBfOe1MVoxQz8fY=;
	b=DN6fxNIFz4mp3LuqmWWrtYUFLBNIkFskuaT4xuRR+tFwwfAi+ax1qwtlu7KHg2ZWdg
	bxVsnA87y1ri0aTXbAJBq7p0WyyH1L05Eqbnty7LyAk+v4YAekthtId1hnWQ1cKYDs5y
	XJva5JszbJG2YZwH1oPmcqsKjxdTV3j7h/5lK3JlHJZzOqZ5lBIyDwFLaBy569d7tD7/
	b2rokRJ3Xt2E9o3w5ioOfZpUQa/yP2u5ay/8f2+Gfnxu9U2bONNqvkVZttOn+7o85YO4
	MiLp17eMakf+aFpwqp2z4xGXjG4Szq9Y8b6Lfay4W2vw7GGq2gp+0aQW/bZZTXySQCUJ
	dGWA==
X-Gm-Message-State: ALoCoQkG0yyVSK0UpQIio7vOUyxI9H6L7LZ5viuXLOCfcFgbDz2RKK+1fyRmGF8/itXaFfnAnpOr
X-Received: by 10.140.218.84 with SMTP id o81mr22380919qhb.22.1445256795590;
	Mon, 19 Oct 2015 05:13:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 19 Oct 2015 05:12:56 -0700 (PDT)
In-Reply-To: <20151019120904.GB2549@jama>
References: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
	<1445249129-1475-2-git-send-email-ross.burton@intel.com>
	<20151019120904.GB2549@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Oct 2015 13:12:56 +0100
Message-ID: <CAJTo0Las=qdUxwGa3w+OibykzRuMnpVs+5oZGojxSGAibH1=QQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] sanity: check that the host has file installed
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
X-List-Received-Date: Mon, 19 Oct 2015 12:13:17 -0000
Content-Type: multipart/alternative; boundary=001a113734b4e9290f05227411d2

--001a113734b4e9290f05227411d2
Content-Type: text/plain; charset=UTF-8

On 19 October 2015 at 13:09, Martin Jansa <martin.jansa@gmail.com> wrote:

> file or filex?
>

Well that was embarassing.  I wonder how that test change made it into git.

Ross

--001a113734b4e9290f05227411d2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 October 2015 at 13:09, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2td" class=
=3D"a3s" style=3D"overflow:hidden">file or filex?</div></blockquote><div><b=
r></div><div>Well that was embarassing.=C2=A0 I wonder how that test change=
 made it into git.</div><div><br></div><div>Ross</div></div></div></div>

--001a113734b4e9290f05227411d2--
