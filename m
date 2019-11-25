Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 420C17CBE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 15:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E36499C026D;
	Mon, 25 Nov 2019 10:03:06 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id INllVlYaHx5p; Mon, 25 Nov 2019 10:03:06 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 67CE79C031E;
	Mon, 25 Nov 2019 10:03:06 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id ntBH0BpV2HDV; Mon, 25 Nov 2019 10:03:06 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 401C09C026D;
	Mon, 25 Nov 2019 10:03:06 -0500 (EST)
Date: Mon, 25 Nov 2019 10:03:06 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <297481662.719279.1574694186234.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <f12cb0c9-04ab-f695-dcaa-de162f7f1672@intel.com>
References: <20191120093358.11622-1-jean-marie.lemetayer@savoirfairelinux.com>
	<b3ae667e644cf4b81c096562965268dbe5596065.camel@linuxfoundation.org>
	<531618732.621500.1574366028835.JavaMail.zimbra@savoirfairelinux.com>
	<50236bca804ff079db05b696f783c9af7e408c8f.camel@linuxfoundation.org>
	<2010614174.635763.1574420884655.JavaMail.zimbra@savoirfairelinux.com>
	<f12cb0c9-04ab-f695-dcaa-de162f7f1672@intel.com>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC78 (Linux)/8.8.11_GA_3737)
Thread-Topic: NPM refactoring
Thread-Index: qsDbcPadOQyi6wpV9Uza8uHPC6+pwA==
Cc: Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 00/17] NPM refactoring
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
X-List-Received-Date: Mon, 25 Nov 2019 15:03:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Ross,

On Nov 25, 2019, at 2:55 PM, Ross Burton ross.burton@intel.com wrote:
> On 22/11/2019 11:08, Jean-Marie LEMETAYER wrote:
>> I based my work on the current implementation, but I never thought of
>> refactoring as much. I have however some concerns about the management
>> of the registry and the development dependencies. I will try to come
>> back with a v4.
> 
> There's a lot of NPM patches flying around now: are any of the patches
> in this 17-long series able to be merged ahead of a full refactor?

No every patches are more or less linked. Moreover Richard points me
some possible enhancements. I will come back with a v4.

Thanks,
Jean-Marie

