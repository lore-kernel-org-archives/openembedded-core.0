Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 52CEE71B99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 14:44:59 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Oct 2017 07:45:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,320,1505804400"; d="scan'208";a="169551159"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2017 07:44:59 -0700
To: Robert Berger <oecore.mailinglist@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <2e5ae597-e0c1-6caf-c8b4-33f0a7f75890@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bc162419-5496-fd5f-6775-dc7005505e3e@linux.intel.com>
Date: Mon, 30 Oct 2017 16:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <2e5ae597-e0c1-6caf-c8b4-33f0a7f75890@gmail.com>
Subject: Re: [PATCH] poky: LICENSE in packagegroup makes no sense - removed
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
X-List-Received-Date: Mon, 30 Oct 2017 14:45:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/30/2017 04:42 PM, Robert Berger wrote:
> 
> Signed-off-by: Robert Berger <robert.berger@ReliableEmbeddedSystems.com>

Better commit message:

nativesdk-packagegroup-sdk-host: remove the LICENSE line


Also, no need to CC Ross, me, or especially Stephen; simply send to the 
list.

Alex

