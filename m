Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5C61560842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:23:06 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i10so4087333oag.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 10:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=c8e80SxgxffGTSXljU9arXaLEY3Uj9CRYE/kqG5AjTQ=;
	b=aIDMxjeC83MOSpbyRgQlP1azUj83MGr9tAOeMk5lYckwQTmgb8BYJRt8vj6him21/V
	hXMNO9g2mkXkFeGxapHIiz1eL/qVM1gvvATEhNmuwBdAcIRHZrZBzAZ4HGAe8g2J51il
	MkDz9MvaTfT1v57TuVl3c2q00qLgKcShYYmWokZ8zGc9axDfizkgDYgVoBYFVCbR7c7Z
	uimXyFR86/d7F4emIJWzPlzfJlhaYAv8vfKANZHW7l7FryKelpUbsuzaiTJvR0txreha
	7GrDrxYOv11udjwOuGJRgkbm+t0ze1EXgZAauwS9jQ24BWk4NqgLpPI1u+YSHhlz5h+w
	k2Qw==
MIME-Version: 1.0
X-Received: by 10.60.44.193 with SMTP id g1mr15529555oem.47.1377192186732;
	Thu, 22 Aug 2013 10:23:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 22 Aug 2013 10:23:06 -0700 (PDT)
In-Reply-To: <1377190468-15466-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1377190468-15466-1-git-send-email-lauren.post@freescale.com>
Date: Thu, 22 Aug 2013 14:23:06 -0300
X-Google-Sender-Auth: 6iqiS8apXbJX9OUEyAI4Vka54jI
Message-ID: <CAP9ODKob6VernR0uDb0PkNpHoH+zNWGYj5gOfGAMHNLkvqgkgQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Lauren Post <lauren.post@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [v4][PATCH 1/2] directfb: Upgrade to 1.6.3
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
X-List-Received-Date: Thu, 22 Aug 2013 17:23:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 22, 2013 at 1:54 PM, Lauren Post <lauren.post@freescale.com> wrote:
> directfb: Upgrade to 1.6.3
>
> Remove mesa patch as 1.6.3 provides compatibility with mesa
>
> Signed-off-by: Lauren Post <lauren.post@freescale.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

