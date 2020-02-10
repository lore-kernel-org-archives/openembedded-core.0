Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id D805C60F19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 08:14:25 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id d3so5485885otp.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fgetZ5AZzWswZoM9D/6sgUgGHsmbR0+h4EgedM9nCrI=;
	b=RuFs+mJwDz/dPkgTAL2BG887T+c9P7AttJtALZQsQFbXa3M0yVM0vccN7LHvgw3Fjf
	hjnwIF8SSSJKrMTzM90Cth5ylvbLEs6f8exfJ4uaJZEuSXlvlE29zBPIzAsU3mtZLhqR
	wZy6kc99cZE44SpFFw9aMvclcFmi+FLrTGi0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fgetZ5AZzWswZoM9D/6sgUgGHsmbR0+h4EgedM9nCrI=;
	b=SmG7QXExQZ+ztaeEQTtXZ5SUy6UDwohav26DBs1E7/yY45TGsYykZYes7Sc54y1MKT
	0ZawDFE94DA85nKRmyDwTHJG++1KEUcxwMY0rs5D8OoHMh7219XFoNyjBMWFxVBs+Pd8
	cl0XaMNyHuLrF4ETkzeYAy8wnjJfSvBsHEC96j/a326YTsEN+d9xuwva2MOxjXOUSlDD
	2MTrkwiqinLn9kviDHmrY08jYIWuJVXgzyEJJ6y0hhu6yVG0fQ22z0Xu4etmOgJiPJ+q
	bAkm2GYh04B0wg5ywhe8C8b7At1t0ycbDPM8G2+VLcfWXRx5GvM6kyD02HpStRH30jRn
	hkpQ==
X-Gm-Message-State: APjAAAVEcqSik5mgnyjHyCPRDs2l3MycYSvDYZ/HXSaor0+Qu296EQLN
	5sxI1tBo2Z5dZkwiHA3Q0U6xNyVHMERb9Ff6UzoSR/g4q09mJA==
X-Google-Smtp-Source: APXvYqxXfYcWIRsG+DcUr9InjYLJcNzc/gm81siDLjUAro/PvufWrkcailfqKM3XCW91j0jgbrpWL5MkDlkcdlwRmRo=
X-Received: by 2002:a9d:4801:: with SMTP id c1mr224133otf.258.1581322466946;
	Mon, 10 Feb 2020 00:14:26 -0800 (PST)
MIME-Version: 1.0
References: <077f01d5dab8$a17a92a0$e46fb7e0$@gmail.com>
In-Reply-To: <077f01d5dab8$a17a92a0$e46fb7e0$@gmail.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Mon, 10 Feb 2020 08:14:16 +0000
Message-ID: <CAM9ZRVuDPzaBHZzzFs1YpWrgTkeTrDtjv_He2WwGm207p5Q0HA@mail.gmail.com>
To: sjolley.yp.pm@gmail.com
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Reminder: Yocto Project Technical Team Meeting @ Monthly from 8am on the first Tuesday (PDT)
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
X-List-Received-Date: Mon, 10 Feb 2020 08:14:27 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Stephen,

The link in your email points to the 2019 minutes, I think the current
link is https://docs.google.com/document/d/1ly8nyhO14kDNnFcW2QskANXW3ZT7QwKC5wWVDg9dDH4/edit.

Thanks,
Paul

On Mon, 3 Feb 2020 at 17:37, <sjolley.yp.pm@gmail.com> wrote:
>
> All,
>
>
>
> Just a reminder we will hold the monthly Yocto Project Technical Meeting at 8am PST tomorrow. (2/4)
>
>
>
> Yocto Project Technical Team Meeting: We encourage people attending the meeting to logon and announce themselves on the Yocto Project IRC chancel during the meeting (optional):
>
> Yocto IRC: http://webchat.freenode.net/?channels=#yocto
>
>
>
> Wiki: https://www.yoctoproject.org/public-virtual-meetings/
>
>
>
> When            Monthly from 8am to 8:30am on the first Tuesday Pacific Time
>
> Where           Zoom Meeting: https://zoom.us/j/990892712
>
>
>
> I am tracking the minutes at: https://docs.google.com/document/d/1Y5IIuE-z0Ykdl-DwuzUJh52flOZuhN_TSAfw2tdU9pg/edit?ts=5c06b22d  Please request access if you want to assist in editing them.  The world should have view access.
>
>
>
> Thanks,
>
>
>
> Stephen K. Jolley
>
> Yocto Project Program Manager
>
> (    Cell:                (208) 244-4460
>
> * Email:              sjolley.yp.pm@gmail.com
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

