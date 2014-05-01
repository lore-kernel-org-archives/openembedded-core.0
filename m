Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 777DD60D67
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 19:38:25 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id v1so3328224yhn.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 May 2014 12:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=8inyjludQl5Jy+QBTJT/BQamo/b7HmWGRQssLc8tGY4=;
	b=xxDkTfh48WId3O8x1OTafPG540cJOJ0fT6d1LgArL4hspiOASh+g2xIOv+5CPm05cA
	Yh684Q9qJvfPAhzGgmvYCkMAQzP7dg2cz21oWpnm2/8Gzfw934IVsZ8JPuYh4ZWztRKS
	vOZcjqHAkYZlnLvaTnVA0fCJG6PJz9EHMTAPdFBbFSxKcyyQ8XkobJb3zpxRlnVy8gjr
	3GMQyR1ZIIYEczwr6zPVy5xJ6cSIFCZvfHkuWDm7jZc3P74ER3DiA78l3TDGTko5b57W
	BUIHAaV6Z4n+brIEEK29BDjnM/VEe5mMBzHQ0bUECk54aWWx4+C+3VZh2UwSjjUosCKh
	aeBg==
MIME-Version: 1.0
X-Received: by 10.236.198.243 with SMTP id v79mr17079189yhn.87.1398973106036; 
	Thu, 01 May 2014 12:38:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 1 May 2014 12:38:25 -0700 (PDT)
In-Reply-To: <20140501061048.GQ2486@jama>
References: <1398890453-24966-1-git-send-email-otavio@ossystems.com.br>
	<20140501061048.GQ2486@jama>
Date: Thu, 1 May 2014 16:38:25 -0300
X-Google-Sender-Auth: _nIfe4zqlmX6MJI-ZWodflfS4Iw
Message-ID: <CAP9ODKpLBaVr-iz9JrAQ+p8kOyEvf8J1MsR3Z_4wsG5CFfuQCg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: Enable GTK support for X11, Wayland and DirectFB
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
X-List-Received-Date: Thu, 01 May 2014 19:38:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 1, 2014 at 3:10 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Apr 30, 2014 at 05:40:53PM -0300, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> This should include required bitbake version bump.

Sent a new patch for it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

