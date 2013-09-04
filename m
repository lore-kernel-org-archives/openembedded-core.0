Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 27EF46BEEE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 13:57:49 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id i4so408777oah.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 06:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=BLEHk+OdxNAw9upF0N202DwpGGhzbKzuCI9IUYE2bk4=;
	b=IhMQTcfe08B8HlnhLGkWkYyWeUO0CS8PHejbarRS5uRUEGfwKBQK3k7ximBL6kNT1f
	p6xafLhyo79aW/oz5ZHbYrzEq5jZj/TXdHmsBllj8D9og91gsvGUB7YUrp4r5frDr3hx
	UmQMI1RnH+mlnosxAYfHBK2MCeYMGqeIYvQ/18SQyY/8Y/bm0joUNZXzPxmUug/65t7k
	Npd98+D6ZB7s7uNLcUdpKLGg4AKB6bvEX+QFrmVCWbrjlX1fuUIFhvupTH5oR78Sf+g9
	c0a9mD+ZInt5iIhXBiT2SRyRFfJ9iJryQHRqiWe9np6xvC3VFVhSLGCrtb4bJF7zJ4Lu
	VDkA==
MIME-Version: 1.0
X-Received: by 10.60.65.227 with SMTP id a3mr2284939oet.13.1378303069938; Wed,
	04 Sep 2013 06:57:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 4 Sep 2013 06:57:49 -0700 (PDT)
In-Reply-To: <9990671.OfVBjYJR7C@atv-pwoegere-l3.atv.mentorg.com>
References: <9990671.OfVBjYJR7C@atv-pwoegere-l3.atv.mentorg.com>
Date: Wed, 4 Sep 2013 10:57:49 -0300
X-Google-Sender-Auth: XAc8ReAyveYX8b9I1VCJQU2knBc
Message-ID: <CAP9ODKqV5YqVLeWgqqXwOftmuQY=K7z=yxB1uLYCS2Hp8rM75g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] lttng: update to lttng 2.3.0
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
X-List-Received-Date: Wed, 04 Sep 2013 13:57:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 4, 2013 at 9:51 AM, Woegerer, Paul <Paul_Woegerer@mentor.com> wrote:
> Since lttng 2.3.0 (Dominus Vobiscum) was released today I have updated the
> respective recipes.
>
> Tested kernel and userspace tracing with TARGET qemux86 as described by:
> http://www.yoctoproject.org/docs/latest/profile-manual/profile-manual.html#lttng-linux-trace-toolkit-next-generation
>
> Noteworthy changes:
> http://lttng.org/lttng-toolchain-230-out
>
> Paul Woegerer (3):
>   lttng-ust: Update to version 2.3.0
>   lttng-tools: Update to version 2.3.0
>   lttng-modules: Update to version 2.3.0

\m/

Great!

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

