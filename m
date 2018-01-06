Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B83A778887
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 10:15:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w06AFVlD028383
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 6 Jan 2018 10:15:32 GMT
Message-ID: <1515233731.29722.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair23@gmail.com>
Date: Sat, 06 Jan 2018 10:15:31 +0000
In-Reply-To: <CAKmqyKO8P6uYTLxDM4xAFCxHA7+Hi9xkTqabJ1FSeGfLRXZpOQ@mail.gmail.com>
References: <20171221215634.26019-1-alistair.francis@xilinx.com>
	<CAKmqyKO0DpoCCzDzoJf9WELTE0fcE7rRS279xbLLPVV5bvff6A@mail.gmail.com>
	<1515055530.5525.176.camel@linuxfoundation.org>
	<CAKmqyKMGTAJuocNKid-mnSAg-bbtoaTH7ih8JjsA-DP5aRYHdA@mail.gmail.com>
	<1515198127.29722.16.camel@linuxfoundation.org>
	<CAKmqyKO8P6uYTLxDM4xAFCxHA7+Hi9xkTqabJ1FSeGfLRXZpOQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: vineethchowz.chowdary@xilinx.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] receipes-devtools: QEMU: Bump to version 2.11.0
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
X-List-Received-Date: Sat, 06 Jan 2018 10:15:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-01-05 at 18:18 -0800, Alistair Francis wrote:
> On Fri, Jan 5, 2018 at 4:22 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > Do you have an easy way to reproduce this hang?
> > Was this a musl build you tried to reproduce in?
> Ah, it was not. I'll have to figure out how to do a musl build next
> week and try again.

TCLIBC="musl"

Cheers,

Richard



