Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U6rCS-0005jA-RH
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 00:29:45 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 32F8FD22E8; Sun, 17 Feb 2013 00:13:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id D10B7D22B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 00:13:10 +0100 (CET)
Message-ID: <51201281.1000801@linaro.org>
Date: Sun, 17 Feb 2013 00:13:05 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1361054460-21397-1-git-send-email-holger@moiji-mobile.com>
In-Reply-To: <1361054460-21397-1-git-send-email-holger@moiji-mobile.com>
Subject: Re: [PATCH] conf: Remove unused ROOT_FLASH_SIZE variable from the config
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2013 23:29:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 16.02.2013 23:41, Holger Hans Peter Freyther pisze:
> This variable is set but never used in OE-core and meta-oe. It
> was historically used for the Opie collection but seems to be
> unused now.

As I am one of those who remember when it was added:

Acked-By: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>


