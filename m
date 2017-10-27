Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id F39B377BC1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 12:41:09 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 27 Oct 2017 05:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="168387246"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Oct 2017 05:41:10 -0700
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1509097262.git.Qi.Chen@windriver.com>
	<4a6127f002e0fa3552e1dbdec8b8d9f94265384a.1509097263.git.Qi.Chen@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c9e9b752-e023-2d2a-224a-111af9ab512b@linux.intel.com>
Date: Fri, 27 Oct 2017 15:41:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <4a6127f002e0fa3552e1dbdec8b8d9f94265384a.1509097263.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 2/2] gcc: fix miscompilation on mips64
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
X-List-Received-Date: Fri, 27 Oct 2017 12:41:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/27/2017 12:43 PM, Chen Qi wrote:

> +This patch comes from https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81803
> +Upstream-Status: Pending [Taken from gcc bugzilla's attachment]

Then it should be 'Submitted', right?

Alex

