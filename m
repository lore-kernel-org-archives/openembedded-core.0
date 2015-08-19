Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BFC7573E11;
	Wed, 19 Aug 2015 14:00:27 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1ZS43M-00058l-Cv from Nathan_Lynch@mentor.com ;
	Wed, 19 Aug 2015 07:09:20 -0700
Received: from [172.30.80.73] (147.34.91.1) by SVR-ORW-FEM-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 19 Aug 2015 07:00:21 -0700
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
References: <1439986711-27572-1-git-send-email-ricardo.ribalda@gmail.com>
From: Nathan Lynch <Nathan_Lynch@mentor.com>
Message-ID: <55D48BF2.3050201@mentor.com>
Date: Wed, 19 Aug 2015 09:00:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1439986711-27572-1-git-send-email-ricardo.ribalda@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Opencv: Add OpenCV 3.0
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
X-List-Received-Date: Wed, 19 Aug 2015 14:00:32 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 08/19/2015 07:18 AM, Ricardo Ribalda Delgado wrote:
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
> @@ -0,0 +1,128 @@
> +SUMMARY = "Opencv : The Open Computer Vision Library"
> +HOMEPAGE = "http://opencv.willowgarage.com/wiki/"

Is this URL outdated?  It times out for me.


