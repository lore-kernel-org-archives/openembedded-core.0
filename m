Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYMq-0005Ex-B7
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:49:36 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:37:56 -0700
Received: by yenq6 with SMTP id q6so6372607yen.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=QFZIZCKvWoCHife3B8xSzM5pnhnN1Y2ajicTEUokzVM=;
	b=eblKg2v/Djap3sG1kQHbI5bE1RVco1wjuOohvQJxXXhnoUl7GIfeGWN9DEGcJp4cZO
	jv5zUMazny+KfsOwTcCM/+KhllDjAZtKyq2cZIrhk4OAuONxp9zU6Wbu82R4cRcVeIOo
	rNATYqKRwgr+cLKcG+AI2/KoLqEzKf4LfFO06vloZfcMnODHZC/+ZbNrbkue1QOWwUVN
	GDnKIf24isxgf46T5M3/qscWeQNrUBZizIpdt1ifWg2Z/aBt4PYBFyxv6IcdcYKk87WA
	grgfF0d8+LtzxfwKKEio26vl3vpTmz87TCJCqq2GEJv1lKhYVNTrVB+IzTlGCs1XZnrC
	R6bg==
Received: by 10.60.0.161 with SMTP id 1mr28277255oef.63.1343824675747; Wed, 01
	Aug 2012 05:37:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Wed, 1 Aug 2012 05:37:31 -0700 (PDT)
In-Reply-To: <20120801123518.GD16306@jama.jama.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<b6ea047dbcbc736d0ee59508a36e907c5271755f.1343823907.git.ross.burton@intel.com>
	<20120801123518.GD16306@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Aug 2012 13:37:31 +0100
Message-ID: <CAJTo0Lbw_=NKyOnFCOJBdrJ9qBhMbdAWprOedjuU_FPAMBwVAA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm8gQxt05x9vpZa00C6f0uRZSPJimJqYSEBD158LTOs22T/dfp6RRTQ3n0tmrN12+OveohT
Subject: Re: [PATCH 05/12] mesa: Update to 8.0.4 (latest stable version)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 12:49:36 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2012 13:35, Martin Jansa <martin.jansa@gmail.com> wrote:
> This ^ isn't for oe-core.

Indeed you're right, I forgot to split it out as I'm lazy and work
from the poky repo.

Ross


