Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 88ABD60E49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 22:50:51 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id pi18so13938939lab.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 15:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=EBvQ0HOxWpQ2Ki26oRH8VtfddoUv1PewgbtWYYu39WA=;
	b=TvVYyPtqI9MeEFl4zacn4LNlEcy0VwbL499QsTLumPZ/vzBZ2iojoV2P7/OnS/yMQA
	xdi+983aUYyg8W8SdcExr1iHHNos8dJZCd7a8hknBXSJOs77SpOPx8tkzeKG/QG+vJ84
	jKL4C9mCoxCkOXFUOJHBayS+WNSoMIzcPi8fjVI8pJccfj0ng0XQZktkKHxPT0jplI6l
	K5MKEIIEOo4NqrXEPLrZTsfwcJBzjVXmcfGSrnRBExpuyX6oY3GVTEGs1clXEuGzckvo
	B1BIQor8nhQDWhMABaY9IzwXLD8yX59hy3tDMcdLLD0m9Vku8HBNPvTbp4ZV/tC+fc05
	kyMw==
X-Received: by 10.152.5.133 with SMTP id s5mr10555375las.78.1409007051784;
	Mon, 25 Aug 2014 15:50:51 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Mon, 25 Aug 2014 15:50:31 -0700 (PDT)
In-Reply-To: <ef9b349c3b2f16c96a386054212baebdd9722c1b.1409006757.git.chris_larson@mentor.com>
References: <cover.1409006757.git.chris_larson@mentor.com>
	<ef9b349c3b2f16c96a386054212baebdd9722c1b.1409006757.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Mon, 25 Aug 2014 15:50:31 -0700
X-Google-Sender-Auth: p9xZz-fQWx9HJWrd6AY21OslRUE
Message-ID: <CABcZANkuX6BjYH1LKLcfQqXZ-W2KeGN2wo5ufzxiLg5Md=yo_w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/3] sanity: handle both \n and \n in mirror vars
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
X-List-Received-Date: Mon, 25 Aug 2014 22:50:59 -0000
Content-Type: multipart/alternative; boundary=089e013d0ffccec6e705017c045e

--089e013d0ffccec6e705017c045e
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 25, 2014 at 3:46 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>


Bah, typo in the subject, fixing. :)

-Chris

--089e013d0ffccec6e705017c045e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 25, 2014 at 3:46 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":21i" class=3D"a3s" style=3D"over=
flow:hidden">From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@me=
ntor.com">chris_larson@mentor.com</a>&gt;<br>


<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br><br></div=
><div class=3D"gmail_extra">Bah, typo in the subject, fixing. :)<br><br></d=
iv>

<div class=3D"gmail_extra">-Chris<br></div></div>

--089e013d0ffccec6e705017c045e--
