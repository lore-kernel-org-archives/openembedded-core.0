Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36D3A6D3CC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 18:40:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA4IeF7Z004929
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Nov 2013 10:40:15 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 4 Nov 2013 10:40:14 -0800
Date: Mon, 4 Nov 2013 12:40:10 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20131104124010.7cc1248f@e6410-2>
In-Reply-To: <52621720.6020001@linux.intel.com>
References: <525EC341.9080407@linux.intel.com>
	<3ccdc8aa31b31e23e22f3a65ffc2543df1718a94.1382138424.git.peter.seebach@windriver.com>
	<52621720.6020001@linux.intel.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Use alternatives for the binutils-symlinks package.
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
X-List-Received-Date: Mon, 04 Nov 2013 18:40:15 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Fri, 18 Oct 2013 22:22:40 -0700
Saul Wold <sgw@linux.intel.com> wrote:

> The commit short message needs to be corrected to the binutils: ... 
> format please.

Okay, corrected the commit message, also fixed a space/tab issue in the
binutils.inc patch.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

