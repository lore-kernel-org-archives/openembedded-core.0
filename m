Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 920726A463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 00:43:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAK0hNsT022185
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Nov 2013 16:43:23 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 19 Nov 2013 16:43:22 -0800
Date: Tue, 19 Nov 2013 18:42:59 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20131119184259.4a12bbde@e6410-2>
In-Reply-To: <20131120003532.GI3708@jama>
References: <cover.1384907111.git.peter.seebach@windriver.com>
	<16a4c667fd7dde1f7d503942c45e03a6bda98ae8.1384907111.git.peter.seebach@windriver.com>
	<20131120003532.GI3708@jama>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sanity.bbclass: Don't fatal() when trying to dump environment.
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
X-List-Received-Date: Wed, 20 Nov 2013 00:43:30 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 20 Nov 2013 01:35:32 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> Inconsistent whitespace

argh. I totally thought I'd fixed those all.

Fixed that one too, updated the branch on contrib.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

