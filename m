Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7383C60F77
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 16:08:51 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hv10so2928863vcb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=qQ+9/wzzqGBCP/IfRUawQU1WMTPNYZyrhmTJE1zWTtc=;
	b=tJv1Pyk0VYl23utvdFe9CBObLo9avpvhtnkSdxXhMa0xJ6YTqKS1vKhuaWRxPTXJf6
	Z8O9vYf8yEKBGdkQfH5OQi79ch26Q98yXbKunNXjR0BNftjDhzVgKX6hmGtoeJlQNefu
	svalfeVHc2a/WifkPafDpRHAljCLAfbOIOhcMUAMrhhEczpJytY1/gNBdKKZxc222fR9
	9iIhel/ZA75jxhxwVn77fNufhGWYMPYeDZtOVay024Vxre0EpHN7ymNyORk5+5CWhhfr
	ax01JTZO/kr8G7TSq8ja1GUFlTJ+McO7eYu/XIQD1MmTt0rZ22TtZLmGljJS4Vaet39N
	8qVw==
X-Received: by 10.52.33.147 with SMTP id r19mr11710vdi.37.1381162132792; Mon,
	07 Oct 2013 09:08:52 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.49.71 with HTTP; Mon, 7 Oct 2013 09:08:12 -0700 (PDT)
In-Reply-To: <5252CCAA.1060105@opendreambox.org>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<1376512209-11622-9-git-send-email-mark.hatle@windriver.com>
	<52125F35.10305@linux.intel.com> <521264DA.8010404@windriver.com>
	<CANyK_8cSzYGQHDCeCCz7HM5yWm=Uq_fkpyr6gbYMJXPxuQxy-Q@mail.gmail.com>
	<5252CCAA.1060105@opendreambox.org>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 7 Oct 2013 17:08:12 +0100
X-Google-Sender-Auth: 9DGCaY1SPR0Nb-N2xrKMfL6UhfQ
Message-ID: <CANyK_8dnUv8EK+0z2E7_Tjr8cG9Gqgr-T2ow9ksGGFqPzAEvoQ@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: opkg-devel <opkg-devel@googlegroups.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg-devel group (was: Re: [PATCH 08/11] opkg: Add --no-install-recommends option.)
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
X-List-Received-Date: Mon, 07 Oct 2013 16:08:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 7 October 2013 16:00, Andreas Oberritter <obi@opendreambox.org> wrote:
> Hello Paul,
>
> I just tried to submit some unrelated patches, but received a DSN due to
> not being subscribed to the opkg-devel group. If I understand correctly,
> this would require setting up a google account first.
>
> Would it be possible to lower the hurdles for contribution?
>

I've set posting to public, we'll see how this goes. Hopefully it
won't result in an increase in spam...

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

