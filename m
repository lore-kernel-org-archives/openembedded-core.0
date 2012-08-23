Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1T4S9i-0000Zs-7O
	for Openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 09:48:42 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 2467AD22E9; Thu, 23 Aug 2012 09:36:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (84-10-244-25.dynamic.chello.pl [84.10.244.25])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6F0F6D22DE;
	Thu, 23 Aug 2012 09:36:17 +0200 (CEST)
Message-ID: <5035DD6D.8060205@linaro.org>
Date: Thu, 23 Aug 2012 09:36:13 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120814 Thunderbird/15.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1345706669-28914-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1345706669-28914-2-git-send-email-marcin.juszkiewicz@linaro.org>
	<20120823073139.GK3029@jama.jama.net>
In-Reply-To: <20120823073139.GK3029@jama.jama.net>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libcap: fetch from Debian
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
X-List-Received-Date: Thu, 23 Aug 2012 07:48:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 23.08.2012 09:31, Martin Jansa pisze:
> On Thu, Aug 23, 2012 at 09:24:29AM +0200, Marcin Juszkiewicz wrote:
>> Original location was kernel.org and it was not restored after server
>> was hacked.
> 
> So the SRC_URI checksums are different because it was repackaged? Please
> include diff of content from those 2 archives in commit message.

Content of those archives is exactly same. Checked md5 sums of all file
in both.


