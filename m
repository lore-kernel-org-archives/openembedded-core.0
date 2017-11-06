Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 38B3171B27
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 11:19:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2017 03:19:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,352,1505804400"; d="scan'208";a="1240247956"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2017 03:19:56 -0800
To: Moritz Fischer <moritz.fischer@ettus.com>,
	openembedded-core@lists.openembedded.org
References: <20171105002559.4822-1-moritz.fischer@ettus.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f38d3964-f472-88b9-2068-fc39305426fa@linux.intel.com>
Date: Mon, 6 Nov 2017 13:20:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171105002559.4822-1-moritz.fischer@ettus.com>
Cc: mdf@kernel.org
Subject: Re: [PATCH] python-mako: Add back the python2 version.
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
X-List-Received-Date: Mon, 06 Nov 2017 11:19:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/05/2017 02:25 AM, Moritz Fischer wrote:
> Add back the recipe for the python2 version.
> 
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
> 
> Is it possible to get that backported into rocko? I somehow didn't see
> the patch that removed it go out on the list.

You need to explain why, as we're actively trying to remove everything 
python2 from oe-core.

Alex

