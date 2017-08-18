Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E6760783F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 11:34:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7IBYqQv032560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 18 Aug 2017 12:34:53 +0100
Message-ID: <1503056092.32591.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 Aug 2017 12:34:52 +0100
In-Reply-To: <1502744948-29741-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
References: <1502744948-29741-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 18 Aug 2017 12:34:53 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] curl: upgrade to 7.55.1
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
X-List-Received-Date: Fri, 18 Aug 2017 11:34:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-14 at 23:09 +0200, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.1.bb} | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.1.bb} (92%)

https://autobuilder.yocto.io/builders/nightly-x32/builds/409/steps/BuildImages/logs/stdio

Cheers,

Richard


