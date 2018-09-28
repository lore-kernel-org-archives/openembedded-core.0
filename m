Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DB32F745A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 07:52:16 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8S7pMuH027680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 28 Sep 2018 08:51:24 +0100
Message-ID: <2393ecdc38c62e94e2ba1fb5115377704a8b4edd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zhaolong Zhang <zhangzl2013@126.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2018 08:51:22 +0100
In-Reply-To: <1538116756-18222-1-git-send-email-zhangzl2013@126.com>
References: <1538116756-18222-1-git-send-email-zhangzl2013@126.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] rpm: fix rpm path in nativesdk
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
X-List-Received-Date: Fri, 28 Sep 2018 07:52:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-09-28 at 14:39 +0800, Zhaolong Zhang wrote:
> Fix the incorrect path inside the nativesdk 'rpmdeps' wrapper.

Could you please elaborate on the commit message to say how its
incorrect, why does it need fixing?

I'm sure it does but its not obvious how/why...

Thanks,

Richard


