Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A8335747D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 16:37:43 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3AGaseC004222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 10 Apr 2018 17:36:55 +0100
Message-ID: <1523378214.2942.158.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Tue, 10 Apr 2018 17:36:54 +0100
In-Reply-To: <20180410143311.GD3228@denix.org>
References: <1515690095-6391-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1515690095-6391-4-git-send-email-richard.purdie@linuxfoundation.org>
	<20180410143311.GD3228@denix.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] sstate: Avoid indirect bison/flex-native dependencies
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
X-List-Received-Date: Tue, 10 Apr 2018 16:37:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-04-10 at 10:33 -0400, Denys Dmytriyenko wrote:
> Richard,
> 
> Was this patch ever merged? I don't see it in master - were there any
> problems 
> or concerns?

There was some kind of failure in testing on the autobuilder which made
me abandon it, I can't remember what it was though :(

Cheers,

Richard

