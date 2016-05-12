Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0049965CC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 18:24:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4CIO8ZN010729
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 May 2016 11:24:08 -0700 (PDT)
Received: from seebs-worktop (172.25.40.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 May 2016 11:24:08 -0700
Date: Thu, 12 May 2016 13:24:06 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20160512132406.12f33a04@seebs-worktop>
In-Reply-To: <1462983927-19691-1-git-send-email-kergoth@gmail.com>
References: <1462983927-19691-1-git-send-email-kergoth@gmail.com>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: obey our LDFLAGS
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
X-List-Received-Date: Thu, 12 May 2016 18:24:11 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 11 May 2016 09:25:27 -0700
Christopher Larson <kergoth@gmail.com> wrote:

> +Subject: [PATCH] Obey external LDFLAGS the way we obey CFLAGS

This has been merged into pseudo's upstream, now, but it's on top of some
large changes, so we should probably go ahead with the local patch until
later.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

