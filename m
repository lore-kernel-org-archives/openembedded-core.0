Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1462E6E949
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 16:03:38 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so7232811pad.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2014 08:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=/Uqt8qy5BFObYqvzD5GyvB1nxUfAoOvFM7Z9HBmcYDI=;
	b=NiC9avO3FZbMP1dVXXfGr+hY/UG/W+ybwRzJHOEJH9avNhgZroh8oT/bIspakCmuMp
	Lc/HtSX23XEDqwdN/jfQX70WxXIwO/vmbXUABd0R7PGR0F8Uc4ZhQd23AfIVABl6fLLn
	BWrfkjBZVIdH0HZ8aISz69+jsIOyX6hhCa5KkRkcdWGjwB8rGRB7s+wIFCuT7UxwkZ92
	nUpKTTdI/V2j316Uq9fBSXsR+jOa+EEIM9tYWzc4GkLJeUj7I8l+ogwcu1/TQFSu/b4M
	z865ZidGzHZ1Sf62UdlhjOYA6xxvaVYt8XMrd8XQpnh2w0+SrdTcH/lIJ4Q9zldWXUb8
	P3zw==
X-Gm-Message-State: ALoCoQnEyilHv/bcHbmMf5VszDQmBXz57GZnCEuPuocAumKvLCR3gqSSa+VTfF4TtPUF3FHrcNNO
MIME-Version: 1.0
X-Received: by 10.66.16.162 with SMTP id h2mr37792294pad.129.1391443419042;
	Mon, 03 Feb 2014 08:03:39 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Mon, 3 Feb 2014 08:03:38 -0800 (PST)
In-Reply-To: <1391245344.28575.19.camel@ted>
References: <CAOMwXhPNi357C8BvFjvVYtQUDepu5VK-c1phR=5UseZg79uJ6Q@mail.gmail.com>
	<CAOMwXhOH0m9PNL10c6gBNhCK+iMoiVtujX1_N3i2KaBAYBgFeQ@mail.gmail.com>
	<1391245344.28575.19.camel@ted>
Date: Mon, 3 Feb 2014 16:03:38 +0000
X-Google-Sender-Auth: fBEIHnBl-VqpAK555u6WczKpnqk
Message-ID: <CAOMwXhPwZyCbb3KR-_YZdqRfTaTcnwCazMYAqi1Vch7CeNqWuw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Putting fltk into oe-core (recipes-graphics)
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
X-List-Received-Date: Mon, 03 Feb 2014 16:03:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 1, 2014 at 9:02 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2014-01-30 at 18:46 +0000, Laszlo Papp wrote:
>> Ping?
>>
>> I asked this a bit more than five months ago. Shall I take it as "No"?
>
> The lack of responses does indicate that its not something there is
> strong support for so I don't think fltk will be moving, correct.

Currently, I do not see any minimal gui library in openembedded core
for building some simple GUI on real embedded devices, but OK.

