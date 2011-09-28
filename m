Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R8pts-0006JJ-Nb
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 10:53:57 +0200
Received: by iadx2 with SMTP id x2so7489965iad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 01:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=HOwBrIQi1Xy4nNTu25pTscnm57OakWr09i/4kaZKIEQ=;
	b=EbvxrqzUqo6P+yQEFuz5kJasKcrsO+sgBTrIqYjZCe+EXaNLMjNU3/yXJPjUu6EmJx
	bzpLJRXMfaGy/di/ECv4XaERWLEa0JrcHNM8fPqxQ9oZyCW7VuoEK1SyP5C/Ak4xMUr0
	ohIZIdc3/YdxVvlbDBU3Qo6/A9DqFsCiqcw4M=
Received: by 10.42.155.5 with SMTP id s5mr1630345icw.52.1317199708945;
	Wed, 28 Sep 2011 01:48:28 -0700 (PDT)
Received: from [137.202.140.192] (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id g16sm33884089ibs.8.2011.09.28.01.48.25
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 01:48:27 -0700 (PDT)
Message-ID: <4E82DF1F.4040809@gmail.com>
Date: Wed, 28 Sep 2011 12:47:27 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Iceowl/1.0b2 Icedove/3.1.13
MIME-Version: 1.0
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] kernel.bbclass: blacklist 'perf-dbg' as well for the modules metapackage
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
X-List-Received-Date: Wed, 28 Sep 2011 08:53:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Sorry to bother all of you, what about this patchset?

-- 
With best wishes
Dmitry


