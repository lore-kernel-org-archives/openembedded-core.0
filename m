Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A2A3B782A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 13:41:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 06:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,397,1491289200"; d="scan'208";a="266735452"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 06:41:03 -0700
Message-ID: <1495806571.26945.15.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Date: Fri, 26 May 2017 08:49:31 -0500
In-Reply-To: <1495783680-1190-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1495783680-1190-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lsbinitscripts: 9.68 -> 9.72
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
X-List-Received-Date: Fri, 26 May 2017 13:41:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-05-26 at 15:28 +0800, Huang Qiyu wrote:
> 1) Upgrade lsbinitscripts from 9.68 to 9.72.
> 2) Modify one patch "functions.patch", since the data has been changed.

the only change I see in the .patch file is the extra -e, is that what
you mean that the data has changed?

Leo



