Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD5165D00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 08:58:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 23 Sep 2016 01:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="764784787"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2016 01:58:08 -0700
Date: Fri, 23 Sep 2016 11:56:41 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Anuj Mittal <anujx.mittal@intel.com>
Message-ID: <20160923085640.GA17846@mbabyjoh-desk.ger.corp.intel.com>
References: <1474620517-4809-1-git-send-email-anujx.mittal@intel.com>
MIME-Version: 1.0
In-Reply-To: <1474620517-4809-1-git-send-email-anujx.mittal@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH] openssl: security fix CVE-2016-6304
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
X-List-Received-Date: Fri, 23 Sep 2016 08:58:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Sep 23, 2016 at 04:48:37PM +0800, Anuj Mittal wrote:
> Reference:
> https://www.openssl.org/news/secadv/20160922.txt
> 
> Upstream fix:
> https://github.com/openssl/openssl/commit/e408c09bbf7c3057bda4b8d20bec1b3a7771c15b
> 
> Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
> ---
>  .../openssl/openssl/CVE-2016-6304.patch            | 75 ++++++++++++++++++++++

Mid air collision with Patrick's patch.

http://lists.openembedded.org/pipermail/openembedded-core/2016-September/126840.html

Regards,
Maxin

