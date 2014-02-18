Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 149086EFC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 21:31:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1ILVXwt020989
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Feb 2014 13:31:33 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 18 Feb 2014 13:31:32 -0800
Date: Tue, 18 Feb 2014 15:31:04 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20140218153104.08751227@e6410-2>
In-Reply-To: <5303AFB8.2090605@linux.intel.com>
References: <1392632257-4669-1-git-send-email-yanjun.zhu@windriver.com>
	<5303AFB8.2090605@linux.intel.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo-1.5.1: keep install command directory mode
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
X-List-Received-Date: Tue, 18 Feb 2014 21:31:33 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 18 Feb 2014 11:08:40 -0800
Saul Wold <sgw@linux.intel.com> wrote:

> There is no patch header here, also have you checked with Peter S on 
> this change?

The change originated with me, and is in my current 1.6 pseudo branch. The
backport was being submitted because I am on other projects actively enough
that I haven't got the time to finish the work for getting 1.6 ready to
submit.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

