Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 347846AC3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:43:19 +0000 (UTC)
Received: by qgg60 with SMTP id 60so41640580qgg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 07:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7TicYxpZmHz7dPxGrPPpz2zyiFj2wgfs63eOmmdX4KU=;
	b=NMJdgL6SH/hSbuPRpJKVeh37vdQE8S+IgszNXrINIXCDdYn5Rahx1bXGatCCz+BiKb
	t2EuYRqdz/zvO1UfGXFddUIc63TKfcYo2zDUUEmVxcBa8CtwI3dbyz3Hsy3CWczTZztv
	qdXe0Ye0KPQdECwPBU4mJTlDYUG0Ggny9lU2NFbA4cXU8IEDmFBTMd0qQljZuueZBNxW
	NCd8+0O89D+YHpAJcR0f1Tg2rkHHrorDt5HQBOJowD6nqEStY2ultKaq3YITsxYWwZND
	pc0H2Omz7gOhEoq9E4n1+O9mAm0FS5QlndYbFQKhGCwhwA31995DSzDcl0SjqYTRwpEt
	to0Q==
X-Gm-Message-State: ALoCoQlz1L9n5LyYGO7+s+Q7iYAgM77QTEv7+Rsp6L/5FqbOxI31LtckCjfuC4US684Qciykg6vg
X-Received: by 10.140.92.33 with SMTP id a30mr73523732qge.30.1426516999810;
	Mon, 16 Mar 2015 07:43:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 16 Mar 2015 07:42:59 -0700 (PDT)
In-Reply-To: <987d508936059ce26d2474cd7d9639c9fab32275.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
	<987d508936059ce26d2474cd7d9639c9fab32275.1426252888.git.patrick.ohly@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Mar 2015 16:42:59 +0200
Message-ID: <CAJTo0LbbLR8_Tz7b_inkEa_EK7vf2zm0YNi-8p9xhTNin-fZ8w@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/11] combo-layer: make Signed-off-by optional
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
X-List-Received-Date: Mon, 16 Mar 2015 14:43:23 -0000
Content-Type: multipart/alternative; boundary=001a1139c2fc0a43e1051168dfac

--001a1139c2fc0a43e1051168dfac
Content-Type: text/plain; charset=UTF-8

On 13 March 2015 at 15:29, Patrick Ohly <patrick.ohly@intel.com> wrote:

> It depends on the diligence of the person running the combo-layer tool
> whether the Signed-off-by line added to each commit actually indicates
> that the person was involved in validating the change.
>

Ironically, this commit is missing the signed-off-by. :)

Ross

--001a1139c2fc0a43e1051168dfac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 March 2015 at 15:29, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3jb" class=
=3D"a3s" style=3D"overflow:hidden">It depends on the diligence of the perso=
n running the <span class=3D"il">combo</span>-layer tool<br>
whether the Signed-off-by line added to each commit actually indicates<br>
that the person was involved in validating the change.</div></blockquote></=
div><br>Ironically, this commit is missing the signed-off-by. :)</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139c2fc0a43e1051168dfac--
