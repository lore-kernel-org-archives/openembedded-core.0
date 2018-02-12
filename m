Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 41CEC6067C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:48:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 00:48:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17767308"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 12 Feb 2018 00:48:54 -0800
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1518424026-25060-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1518424026-25060-2-git-send-email-rebecca.swee.fun.chang@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <fb6ff954-744b-b38a-59b1-4d5afa879ec9@linux.intel.com>
Date: Mon, 12 Feb 2018 10:42:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518424026-25060-2-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: Re: [PATCH 2/2] build-appliance-image: update version to 19.0.0
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
X-List-Received-Date: Mon, 12 Feb 2018 08:48:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/12/2018 10:27 AM, Chang Rebecca Swee Fun wrote:
> Updating recipe to reflect latest poky version and SRCREV points
> to latest master HEAD revision.

The latest poky version is 18.0.1, and I think SRCREV should point to 
that as well, not to the tip of master? 19.0.0 isn't yet released.


Alex

