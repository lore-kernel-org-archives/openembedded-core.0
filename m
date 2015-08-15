Return-Path: <caschebe@techfak.uni-bielefeld.de>
Received: from smarthost.TechFak.Uni-Bielefeld.DE
	(smarthost.TechFak.Uni-Bielefeld.DE [129.70.137.17])
	by mail.openembedded.org (Postfix) with ESMTP id 73B5772A78
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Aug 2015 23:33:09 +0000 (UTC)
Received: from [192.168.0.190] (unknown [89.244.98.117])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested) (Authenticated sender: caschebe)
	by smarthost.TechFak.Uni-Bielefeld.DE (Postfix) with ESMTPSA id
	D9B0880041 for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 01:33:08 +0200 (CEST)
Message-ID: <55CFCC35.9090005@techfak.uni-bielefeld.de>
Date: Sun, 16 Aug 2015 01:33:09 +0200
From: Christian Ascheberg <caschebe@techfak.uni-bielefeld.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1361976853.git.tom.zanussi@linux.intel.com>
Subject: Re: [PATCH 0/3] add libaudit and enable 'perf trace'
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
X-List-Received-Date: Sat, 15 Aug 2015 23:33:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

perf-trace requires libaudit, but there is still no support for it 
integrated into openembedded, although a patch has been suggested quite 
a while ago.
It would still be great to see that being implemented.

Thanks
Christian

