Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C5BE265D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 19:01:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAAJ1EEX007542
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Nov 2014 11:01:15 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 10 Nov 2014 11:01:14 -0800
Date: Mon, 10 Nov 2014 13:00:53 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20141110130053.01f6bece@e6410-2>
In-Reply-To: <1415457765.2820.21.camel@linuxfoundation.org>
References: <cover.1415390286.git.peter.seebach@windriver.com>
	<d2ce73488a8afb7a8d10286da138810d30b4a4be.1415390286.git.peter.seebach@windriver.com>
	<1415457765.2820.21.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] eglibc-use-option-groups.patch: Several fixups
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
X-List-Received-Date: Mon, 10 Nov 2014 19:01:18 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Sat, 8 Nov 2014 14:42:45 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> Whilst I haven't 100% confirmed it,
> https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/102/steps/BuildImages/logs/stdio
> looks like it may well be as a result of this change (which was included
> in the master-next build in question)...

Hmm. I am *pretty* sure I was successfully building things with this patch.
But it does look suspiciously similar.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

