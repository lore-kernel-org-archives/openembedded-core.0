Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TfpT7-0001KO-SV
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 11:11:19 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id D73D4D22C0; Tue,  4 Dec 2012 10:57:05 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 71533D22B4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2012 10:56:35 +0100 (CET)
Message-ID: <50BDC8C3.6060607@linaro.org>
Date: Tue, 04 Dec 2012 10:56:19 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1354207309-27534-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1354207309-27534-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH] libffi: add AArch64 support
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
X-List-Received-Date: Tue, 04 Dec 2012 10:11:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 29.11.2012 17:41, Marcin Juszkiewicz pisze:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../libffi/aarch64-adding-build-support.patch      |   63 +
>  .../libffi/libffi/add-aarch64-support.patch        | 2672 ++++++++++++++++++++
>  meta/recipes-gnome/libffi/libffi_3.0.11.bb         |    7 +-
>  3 files changed, 2740 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-gnome/libffi/libffi/aarch64-adding-build-support.patch
>  create mode 100644 meta/recipes-gnome/libffi/libffi/add-aarch64-support.patch

ping?



