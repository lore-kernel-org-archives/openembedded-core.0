Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1762C60685
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 11:41:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Oct 2019 04:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,268,1566889200"; d="scan'208";a="196262647"
Received: from pmadmonx-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.38.125])
	by orsmga003.jf.intel.com with ESMTP; 07 Oct 2019 04:41:50 -0700
To: openembedded-core@lists.openembedded.org
References: <20191005210834.28170-1-stefan@agner.ch>
	<20191005213159.2334.53447@do>
	<a35970e05f8d82a43f3f6aa81052bce2@agner.ch>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <d299a531-c5d5-48af-064d-0627d5747dfa@intel.com>
Date: Mon, 7 Oct 2019 12:41:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a35970e05f8d82a43f3f6aa81052bce2@agner.ch>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHpyYW06IHByb3Blcmx5IGltcGxlbWVudCBzeXN0ZW1kIHNlcnZpY2U=?=
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
X-List-Received-Date: Mon, 07 Oct 2019 11:41:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/10/2019 23:20, Stefan Agner wrote:
> As an on and off contributor I rely on the instructions in the OE wiki.
> Unfortunately the example for meta-oe is just next of an example using
> the openembedded-core@lists.openembedded.org. Maybe the second example
> should contain the correct address for meta-oe as well?
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_patches

That isn't a meta-oe specific example, but the typical OE-wide workflow 
unless the layer says otherwise.

Quoting from the page:

"""
You need to subscribe to the appropriate mailing-list in order to be 
able to send your patch(es) there; for patches against OE-Core the 
mailing list is openembedded-core@lists.openembedded.org and for patches 
against meta-oe and many other layers the list is 
openembedded-devel@lists.openembedded.org. See Mailing lists for 
subscription and further details.
"""

Ross

