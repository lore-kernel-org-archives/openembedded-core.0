Return-Path: <twoerner@gmail.com>
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by mail.openembedded.org (Postfix) with ESMTP id 114A479E9A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 15:49:02 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id m18-v6so14519792lfl.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 08:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ur5tvb+wVM5ka1nQqR0wU03QMc8ES2MqyoiDDZFpN1I=;
	b=k/1topItkPxiYAMfZxIDbN3EPKlbaGOZVOgU8gFxZZ9gsRP1XWsnniwdoiQzss9aD0
	hIzODND07d6RYFqOwn7vuvy0cLMR1jw5/ds2oqsDGEZ+ZvNRUyDiByxDPWFkFwnpRw8L
	NGos/QgU9GgKmyLwsyOdJa6rOfhiWxTAtAxXLHl4dLold8f7ve1qYVZ7Be6k6Am+IJv4
	5/ptzebmrK9ysRPNSWOnnG5kt+R3MgQ6upVfQPx35TWnmBGEt9zQwvFbMRTZCuv8URuS
	fBfYkwL+mrOsEay1QrJXLEJZS3OEcNmjn2wSzs52OLiLhlNr1rj8X4aiaz9ALPulkKvj
	ALiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ur5tvb+wVM5ka1nQqR0wU03QMc8ES2MqyoiDDZFpN1I=;
	b=Um901wphZ9Q2Y/ZBqA29+ybzP/0F0Ou5gfGCbeDePt1XARWUOBfarlH5ZtGmVaxyjj
	y8HMP1pfSK2ovHd47ZeJlvsFUQXCS4Q5YpO/3oa9l61bfBKvcg5jviU4aeRFDQ0R9bNU
	UZU83KxZoswkVU85cnEskcdxVId0gX8hCvejyfmxf36EfEwFW6ugzguirLimvIFaDTDR
	xqSjkBdPn0PZw3PPI7j+wawatJJIpruICAz/ZEXlKMIQpPzHAyATPNuRrcjJ89u+TF+2
	fe6CqjJeGDoqUCBHLBi2iv/yIKzxpQAqhqZLhRTUrQ3hrODD4kcwxdTx/zXSi/KtkExN
	hs7g==
X-Gm-Message-State: AGRZ1gL5LsttN3yKg/rv0jvwGIiYXWBQI5bHJrFNVEosXkCNDIE6Cnqa
	CareyQfRqEzVI/i6aJHsscMN/4pVUUmQp8ek7fBtdXRU
X-Google-Smtp-Source: AJdET5f2gnXYP8kKsijqhVn1NVdD8+JbHLyLBsNubfGxqL4Cz6uS72ih0jElOCu3Q7aGFjInVWCDCxRPZuRIP3y2Xuo=
X-Received: by 2002:a19:5f1e:: with SMTP id t30mr4588053lfb.76.1541087343013; 
	Thu, 01 Nov 2018 08:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20181101140417.GA12376@linux-uys3>
	<6b8e3db1-d7f1-8abb-dc79-c3fa1c03b97d@gmail.com>
In-Reply-To: <6b8e3db1-d7f1-8abb-dc79-c3fa1c03b97d@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 1 Nov 2018 15:48:51 +0000
Message-ID: <CAHUNapQP5JxaGu9XnOdHAvJOS3LXYs=2u5Mumty9s_uSXZY=bA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	yocto-advocacy@yoctoproject.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OEDAM @ SCaLE 2019
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
X-List-Received-Date: Thu, 01 Nov 2018 15:49:03 -0000
Content-Type: multipart/alternative; boundary="000000000000a613f405799c5b1c"

--000000000000a613f405799c5b1c
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 1, 2018 at 3:32 PM akuster808 <akuster808@gmail.com> wrote:

> Trevor,
>
>
> On 11/1/18 7:04 AM, Trevor Woerner wrote:
> > Please see time indices: 12:13 and 16:45
> >
> https://docs.google.com/document/d/1YDAHjIOXCIgvSZVOKCYLxa8h26dkruX8zspoge7zCpk
>
> Could you please give us a day's notice the next time so we can properly
> set the perms for our minutes.
>
>
Will do, sorry!

--000000000000a613f405799c5b1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Nov 1,=
 2018 at 3:32 PM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">aku=
ster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Tr=
evor,<br>
<br>
<br>
On 11/1/18 7:04 AM, Trevor Woerner wrote:<br>
&gt; Please see time indices: 12:13 and 16:45<br>
&gt; <a href=3D"https://docs.google.com/document/d/1YDAHjIOXCIgvSZVOKCYLxa8=
h26dkruX8zspoge7zCpk" rel=3D"noreferrer" target=3D"_blank">https://docs.goo=
gle.com/document/d/1YDAHjIOXCIgvSZVOKCYLxa8h26dkruX8zspoge7zCpk</a><br>
<br>
Could you please give us a day&#39;s notice the next time so we can properl=
y<br>
set the perms for our minutes.<br>
<br></blockquote><div><br></div><div>Will do, sorry! </div></div></div>

--000000000000a613f405799c5b1c--
