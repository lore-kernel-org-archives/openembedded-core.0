Return-Path: <twoerner@gmail.com>
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by mail.openembedded.org (Postfix) with ESMTP id BE7D774E1A;
	Thu,  6 Sep 2018 20:00:13 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id h64-v6so10133997lfi.10;
	Thu, 06 Sep 2018 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yFIdDPcHMfbkaMzmY6dESzSGGuS240SpkFeEPR0CqGc=;
	b=ZlNvLqnxwm9q24igyKFf9E8NUp7Fzjx6hKW7EN1WMyatWqHKn1w+CMknek+S0vDv5q
	lToczuegCT9z/CPxXiZ6aTOZJBLXY/PpZi+ENuJxSaytQUYwCace7XZmpWj3nVDW/8V2
	cZpRLW6lBoyYk+vJ6/iEp1CCIlk1JASXyqU5PguYGobiwbRxxy3Lc9ridN3Ng/TbXAwh
	zxx5Vfdj4BX8fBYoXR7QPaaZZ7x7AbC56PKE3AyAWimiCUqrieYl9GkDb/k5mfsgc+M6
	CTcerPO+4EE/p8Ap32oM8YYWBOO3elmaevc9+W2jYgvraGG5BkRG94dU3ncuPX612++9
	B2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yFIdDPcHMfbkaMzmY6dESzSGGuS240SpkFeEPR0CqGc=;
	b=eGNjI6/yOOZndh4QghrsvpIN+3jsc3IRwJKgCbkpr6so4TSMuWU5kqkuS1HyUGwT0p
	LO4nOcZ3NZSDhdASWMAUtXwhzjPIM3K+dJ4KNrPw03KGi2H+Tbo05NxixInCjIQbM/z0
	2KP1Uir5wVVcpYEN8UzGa49hJPE1WlHFkKbJ2iJy+EJc0Sbmv0pv1/qFXVWVCwJ784R2
	AqfROaG9qNEaK/qUJtDjFj+DammJr2h/Q/eeRxcj0nQSebm49AonLfuczbBfe0XlJlON
	vklKn7QaTVletAbRsZ8uWrM1udX6G6vlhNRXkIO+8N3e5cj90cwysn2zJ60Je2lYOaqk
	nsdg==
X-Gm-Message-State: APzg51BJRXCn/JSgsrdzzP9I6WGPZhWbvUJbjixW8qg9ESsFcQbCUgFp
	ng8gBzMmZZ3EN6H+1JklzbDFWpnPJGLILYaIWMk=
X-Google-Smtp-Source: ANB0Vdax5XyldOy9Q0JzGxfTwgGXVeT+7F0cSgtWYoDaM3CUNvNJ6kyj8sZ3K9Fup2xmQkHACFosI/PU6g3yhW3oSoA=
X-Received: by 2002:a19:1388:: with SMTP id 8-v6mr3100670lft.12.1536264014366; 
	Thu, 06 Sep 2018 13:00:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1585:0:0:0:0:0 with HTTP;
	Thu, 6 Sep 2018 13:00:13 -0700 (PDT)
In-Reply-To: <CANNYZj8Doupz9W1zeuC5xygjqQ_ea3+v5Wa9xuBKSykLQ=yAJA@mail.gmail.com>
References: <81713c72-e806-ba69-0e6d-7ef4a2c00010@gmail.com>
	<CANNYZj8Doupz9W1zeuC5xygjqQ_ea3+v5Wa9xuBKSykLQ=yAJA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 6 Sep 2018 16:00:13 -0400
Message-ID: <CAHUNapR1AJEsDg8TUig18uSzYE74X7QGgj2pgc3Uo5OnaMxRVA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OEDEM Sunday, 21 October 2018 in Edinburgh (before ELCE) - Update
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
X-List-Received-Date: Thu, 06 Sep 2018 20:00:14 -0000
Content-Type: multipart/alternative; boundary="000000000000db92b6057539561c"

--000000000000db92b6057539561c
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 6, 2018 at 5:39 AM, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> And the link for signing up is...? :)
>

https://www.openembedded.org/wiki/OEDEM_2018

or email Armin

--000000000000db92b6057539561c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Sep 6, 2018 at 5:39 AM, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>And the link for signing up is...? :)<br></blockquote><div><br></div><div>=
<a href=3D"https://www.openembedded.org/wiki/OEDEM_2018">https://www.openem=
bedded.org/wiki/OEDEM_2018</a><br></div></div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote">or email Armin<br></div></div></div>

--000000000000db92b6057539561c--
