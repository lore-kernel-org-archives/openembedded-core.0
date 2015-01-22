Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7695871144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:21:20 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id f51so1325244qge.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 06:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KZmaCLOYiDT0D2Sc590UieCeVZYbeZOAdJttlDH6W0Q=;
	b=fBnkbunQvAwmqumoqT1mrFnGgHVelRx9T4YftbssGZZMS59sbBiU5fvj9sxkQjTSBK
	4jgOYvBDx0xTujdGMBiMQj2PyVLMiou6DHAyB1fh4AuTkAV36DYf/bvJPMwj7Pw/7vVC
	GomRJ8oMwPvPuI1z9LYp4TC76dgfydKjgV1sYOdcaHsN1VDD5h61+dioq0nIYuWd9cSL
	6BQsVy6T9yFnuny3E9N9WsLndnOtRo78pIIQaGeKqSDsaZ7pAWhgj52E39d8aG2b3tIK
	YFzXjGDTwAcCgWtMOWfCHMTx+FLsCIGnW016k39sb+9BYC37ytXYkWrKwKdiyoRNY1tr
	W4CQ==
X-Gm-Message-State: ALoCoQnf2LT9263xUkW3sl1z6Nr6QtvKbrYz0s9shene9eqqrxrc1b3BQ0SCsSxoXggzmXjszeib
X-Received: by 10.224.20.133 with SMTP id f5mr2913105qab.17.1421936481336;
	Thu, 22 Jan 2015 06:21:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 22 Jan 2015 06:21:01 -0800 (PST)
In-Reply-To: <7805B0FACE4FCC4E84636AB320CBA4AC360C560B@ALA-MBB.corp.ad.wrs.com>
References: <1421499689-4863-1-git-send-email-daniel.dragomir@windriver.com>
	<7805B0FACE4FCC4E84636AB320CBA4AC360C560B@ALA-MBB.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jan 2015 14:21:01 +0000
Message-ID: <CAJTo0Lb1jQ_1ZCY8OrL6GaZ7S6VnBf3cea2ndLT1O69OyLW46Q@mail.gmail.com>
To: "Dragomir, Daniel" <Daniel.Dragomir@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gcc-runtime: Remove libgfortran data from receipe
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
X-List-Received-Date: Thu, 22 Jan 2015 14:21:31 -0000
Content-Type: multipart/alternative; boundary=001a11c2b82edd2a32050d3e62d1

--001a11c2b82edd2a32050d3e62d1
Content-Type: text/plain; charset=UTF-8

On 22 January 2015 at 13:37, Dragomir, Daniel <Daniel.Dragomir@windriver.com
> wrote:

> If there are no problems with this patch, can you please cherry-pick this
> into
> the dizzy branch too?
>

FYI this is queued in MUT so should be in master soon.

Ross

--001a11c2b82edd2a32050d3e62d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2015 at 13:37, Dragomir, Daniel <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Daniel.Dragomir@windriver.com" target=3D"_blank">Daniel.Dragomir=
@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":5bj" class=3D"a3s" style=3D"overflow:hidden">If there are no proble=
ms with this patch, can you please cherry-pick this into<br>
the dizzy branch too?</div></blockquote></div><br>FYI this is queued in MUT=
 so should be in master soon.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a11c2b82edd2a32050d3e62d1--
