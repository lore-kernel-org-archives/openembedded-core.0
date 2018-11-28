Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A588C6CEE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 21:55:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2018 13:55:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,292,1539673200"; d="scan'208";a="254091839"
Received: from yngiam-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.142.7])
	by orsmga004.jf.intel.com with ESMTP; 28 Nov 2018 13:55:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 10:55:25 +1300
Message-ID: <3617389.9Irff3jv64@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <cover.1543378296.git.paul.eggleton@linux.intel.com>
References: <cover.1543378296.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] recipeutils fixes for devtool
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
X-List-Received-Date: Wed, 28 Nov 2018 21:55:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 28 November 2018 5:16:13 PM NZDT Paul Eggleton wrote:
> A couple of fixes for issues in the recipeutils module (which affect
> devtool), a cleanup patch, and some additional related tests for
> oe-selftest.

Oops, patch 4/4 missed out the actual meta-selftest recipes that a few of the 
tests rely upon. Branch re-pushed and v2 of 4/4 sent.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



