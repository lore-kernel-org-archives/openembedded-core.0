Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 413577293D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 17:03:30 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id h136so19386891oig.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 09:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JDAPN12IeQ7qcbu2CW9HhgGBInZynLNyhB2rfFSH+FM=;
	b=icwknjFiuziB79Q/KGnAy5zfDfAXJR7aiUqJ6zujxjlde2gqCIh8I6jYlV23AMkCcx
	RGbWgSXTgOm55mmvhwx9hOcCM/XS2sFAg//Lw5vbYkUXjJCpSCZkSTfOJlAmnryWr9bd
	bQncONyS/wcZD2nlaeTUNs/Va3Esw9eRXV63U1usWlgZJT+pNJFPDgDkHMh9X5pz4i8s
	JTgsk307oumGCsVMkcBdizIoZYj98Q0K6ccNBBrkvNgpcQcnstvJ7LDfx04yiUeHeQpv
	d142+cvdh9EQHpyngc4z2IpmbSCgL4Dq/hmNnbVbHMHwDmEkM2gLdNm1kkd7wolqhhTi
	ibng==
X-Gm-Message-State: ALoCoQnQWN36c1womHzUdNCFkMWBhV/mG9DeUS+/W4/CZ8UdMeefhVFVx6UAcn2GCz5+yv9uvnty
X-Received: by 10.202.213.144 with SMTP id m138mr54119052oig.87.1420563811156; 
	Tue, 06 Jan 2015 09:03:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.79.1 with HTTP; Tue, 6 Jan 2015 09:03:10 -0800 (PST)
In-Reply-To: <alpine.LFD.2.11.1501061158150.24771@localhost>
References: <alpine.LFD.2.11.1501061158150.24771@localhost>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 6 Jan 2015 18:03:10 +0100
Message-ID: <CAP71WjwrWvzuURNHWvdt_0T6iAWRpxTjx1dYXuAyND2KsxyfYQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: so, which mailing list is for what?
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
X-List-Received-Date: Tue, 06 Jan 2015 17:03:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 6, 2015 at 5:59 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> apparently, i still don't have a handle on the correct mailing list
> for particular patch submissions -- where's the explanation as to what
> goes where?

http://www.openembedded.org/wiki/Mailing_lists

>
>   in particular, i want to submit some cleanups for some oe-core
> packagegroup recipe files, which list does that go to? thanks. i'll
> figure this out eventually.

oe-core patches should go to openembedded-core@lists.openembedded.org

